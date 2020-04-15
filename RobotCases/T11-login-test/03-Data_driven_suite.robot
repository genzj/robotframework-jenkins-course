*** Settings ***
Resource          ../R01-lib-resource.robot

*** Test Cases ***
abnormal login - keyword
    Abnormal Login Test    user123    pass123    Your username is invalid!
    Abnormal Login Test    tomsmith    pass123    Your password is invalid!

abnormal login - data
    [Template]    Abnormal Login Test
    user123    pass123    Your username is invalid!
    tomsmith    pass123    Your password is invalid!

*** Keywords ***
Abnormal Login Test
    [Arguments]    ${username}    ${password}    ${expected error msg}
    sl.Open Browser    http://121.41.27.81:8001/login    browser=chrome
    sl.Input Text    name=username    ${username}
    sl.Input Password    name=password    ${password}
    sl.Click Button    tag=button
    sl.Element Should Contain    css=.example h2    Login Page
    sl.Element Should Be Visible    css=.flash.error
    sl.Element Should Contain    css=.flash.error    ${expected error msg}
    [Teardown]    sl.Close All Browsers
