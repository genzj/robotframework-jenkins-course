*** Settings ***
Documentation     https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.txt
Test Setup        req.Create Session    httpbin    https://httpbin.org
Library           RequestsLibrary    WITH NAME    req
Library           Collections
Library           OperatingSystem    WITH NAME    os

*** Test Cases ***
GET
    ${resp} =    req.Get Request    httpbin    /ip
    Should Be Equal As Integers    ${resp.status_code}    200
    Collections.Log Dictionary    ${resp.json()}
    Collections.Dictionary Should Contain Key    ${resp.json()}    origin

POST form
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${data} =    Create Dictionary    username=admin    password=pass123
    ${resp} =    req.Post Request    httpbin    /post    ${data}    headers=${headers}
    Should Be Equal As Integers    ${resp.status_code}    200
    Collections.Log Dictionary    ${resp.json()}
    Collections.Dictionary Should Contain Key    ${resp.json()}    form
    Collections.Log Dictionary    ${resp.json()['form']}
    Collections.Dictionaries Should Be Equal    ${resp.json()['form']}    ${data}

POST json
    ${data} =    Create Dictionary    username=admin    password=pass123
    ${resp} =    req.Post Request    httpbin    /post    json=${data}
    Should Be Equal As Integers    ${resp.status_code}    200
    Collections.Log Dictionary    ${resp.json()}
    Collections.Log Dictionary    ${resp.json()['json']}
    Collections.Dictionaries Should Be Equal    ${resp.json()['json']}    ${data}

POST file
    ${file_data} =    os.Get Binary File    ${LOG_FILE}
    ${data} =    Create Dictionary    logfile=${file_data}
    ${resp} =    req.Post Request    httpbin    /post    files=${data}
    Should Be Equal As Integers    ${resp.status_code}    200
    Collections.Log Dictionary    ${resp.json()}
    Collections.Dictionary Should Contain Key    ${resp.json()}    files
    Collections.Dictionary Should Contain Key    ${resp.json()['files']}    logfile
