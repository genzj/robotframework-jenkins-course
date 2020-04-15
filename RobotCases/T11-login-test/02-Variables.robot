*** Settings ***
Resource          ../R01-lib-resource.robot

*** Variables ***
${username}       user123
${password}       pass123
${expected error msg}    Your username is invalid!

*** Test Cases ***
abnormal login - invalid anything
    [Setup]    sl.Open Browser    http://121.41.27.81:8001/login    browser=chrome
    ${username}=    Set Variable    user123
    ${password}=    Set Variable    pass123
    ${expected error msg}=    Set Variable    Your username is invalid!
    sl.Input Text    name=username    ${username}
    sl.Input Password    name=password    ${password}
    sl.Click Button    tag=button
    sl.Wait Until Element Is Visible    css=.flash.error    timeout=1min
    sl.Element Should Contain    css=.example h2    Login Page
    sl.Element Should Be Visible    css=.flash.error
    sl.Element Should Contain    css=.flash.error    ${expected error msg}
    [Teardown]    sl.Close All Browsers

abnormal login - invalid variable
    [Setup]    sl.Open Browser    http://121.41.27.81:8001/login    browser=chrome
    sl.Input Text    name=username    ${username}
    sl.Input Password    name=password    ${password}
    sl.Click Button    tag=button
    sl.Wait Until Element Is Visible    css=.flash.error    timeout=1min
    sl.Element Should Contain    css=.example h2    Login Page
    sl.Element Should Be Visible    css=.flash.error
    sl.Element Should Contain    css=.flash.error    ${expected error msg}
    [Teardown]    sl.Close All Browsers
