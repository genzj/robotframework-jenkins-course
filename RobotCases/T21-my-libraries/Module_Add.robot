*** Settings ***
Library           ../libs/MyAdd.py

*** Test Cases ***
addition
    ${sum}=    Add    1
    ${ans}=    Convert To Integer    2
    Should Be Equal As Integers    ${sum}    ${ans}
    ${sum}=    Add    1.5
    ${ans}=    Convert To Number    2.5
    Should Be Equal As Numbers    ${sum}    ${ans}
    ${sum}=    Add    9999    -10000
    ${ans}=    Convert To Integer    -1
    Should Be Equal As Integers    ${sum}    ${ans}
