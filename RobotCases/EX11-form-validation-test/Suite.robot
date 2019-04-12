*** Settings ***
Resource          ../R01-lib-resource.robot
Resource          keywords.robot

*** Test Cases ***
fill form
    [Setup]    sl.Open Browser    https://jqueryvalidation.org/files/demo/    browser=chrome
    Fill Form    username    email@email.com    abcde
    sl.Capture Page Screenshot
    [Teardown]    sl.Close All Browsers

form validation
    [Template]    Test Form Validation
    s12    \    s12@email.com    \    abcd    ${EMPTY}
    s    Please enter at least 2 characters.    s12@email.com    \    abcd    ${EMPTY}
