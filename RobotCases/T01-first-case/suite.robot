*** Settings ***

*** Test Cases ***
test say hello
    ${s} =    Set Variable    Hello World
    Should Be Equal As Strings    ${s}    Hello World
    Log    ${s}
