*** Settings ***
Library           SeleniumLibrary    timeout=5.0    implicit_wait=1.0    WITH NAME    sl

*** Test Cases ***
first selenium test
    sl.Open Browser    http://www.baidu.com    browser=chrome
    sl.Capture Page Screenshot
    ${title}=    sl.Get Title
    Should Contain    ${title}    百度一下
    [Teardown]    sl.Close All Browsers
