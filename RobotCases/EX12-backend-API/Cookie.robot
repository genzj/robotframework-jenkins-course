*** Settings ***
Test Setup        req.Create Session    httpbin    https://httpbin.org
Library           RequestsLibrary    WITH NAME    req
Library           Collections
Library           OperatingSystem    WITH NAME    os

*** Test Cases ***
Keep Cookie
    ${cookies to set} =    Create Dictionary    k1=v1    k2=v2
    req.Get Request    httpbin    /cookies/set    params=${cookies to set}
    ${resp} =    req.Get Request    httpbin    /cookies
    Collections.Log Dictionary    ${resp.json()}
    Collections.Dictionaries Should Be Equal    ${resp.json()['cookies']}    ${cookies to set}
