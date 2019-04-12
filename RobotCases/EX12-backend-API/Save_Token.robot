*** Settings ***
Test Setup        Login and Keep Token
Library           RequestsLibrary    WITH NAME    req
Library           Collections

*** Test Cases ***
Test with token
    [Setup]    Login and Keep Token
    req.Create Session    httpbin    https://httpbin.org    headers=${token_header}
    ${resp} =    req.Get Request    httpbin    /get
    Collections.Log Dictionary    ${resp.json()['headers']}

*** Keywords ***
Login and Keep Token
    ${data} =    Create Dictionary    TOKEN=1234abcd
    req.Create Session    httpbin    https://httpbin.org
    ${resp} =    req.Get Request    httpbin    /response-headers    params=${data}
    Should Be Equal As Integers    ${resp.status_code}    200
    Collections.Log Dictionary    ${resp.headers}
    Collections.Dictionary Should Contain Key    ${resp.headers}    TOKEN
    Set Test Variable    ${token}    ${resp.headers['TOKEN']}
    Set Suite Variable    &{token_header}    TOKEN=${token}
