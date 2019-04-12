*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
first selenium test
    SeleniumLibrary.Open Browser    http://www.baidu.com    browser=chrome
    SeleniumLibrary.Capture Page Screenshot
    ${title}=    SeleniumLibrary.Get Title
    Should Contain    ${title}    百度一下
    [Teardown]    SeleniumLibrary.Close All Browsers
