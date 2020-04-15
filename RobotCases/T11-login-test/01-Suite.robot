*** Settings ***
Library           SeleniumLibrary    WITH NAME    sl

*** Test Cases ***
normal login
    [Setup]    sl.Open Browser    http://121.41.27.81:8001/login    browser=chrome
    sl.Input Text    name=username    tomsmith
    sl.Input Password    name=password    SuperSecretPassword!
    sl.Click Button    tag=button
    sl.Element Should Contain    css=.example h2    Secure Area
    [Teardown]    sl.Close All Browsers

abnormal login - invalid password
    [Setup]    sl.Open Browser    http://121.41.27.81:8001/login    browser=chrome
    sl.Input Text    name=username    tomsmith
    sl.Input Password    name=password    user123
    sl.Click Button    tag=button
    sl.Element Should Contain    css=.example h2    Login Page
    sl.Element Should Be Visible    css=.flash.error
    sl.Element Should Contain    css=.flash.error    Your password is invalid!
    [Teardown]    sl.Close All Browsers

abnormal login - invalid username
    [Setup]    sl.Open Browser    http://121.41.27.81:8001/login    browser=chrome
    sl.Input Text    name=username    user123
    sl.Input Password    name=password    user123
    sl.Click Button    tag=button
    sl.Element Should Contain    css=.example h2    Login Page
    sl.Element Should Be Visible    css=.flash.error
    sl.Element Should Contain    css=.flash.error    Your username is invalid!
    [Teardown]    sl.Close All Browsers
