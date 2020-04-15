*** Settings ***
Library           OperatingSystem    WITH NAME    os
Library           String    WITH NAME    str

*** Test Cases ***
01-echo-test
    ${rc}    ${result}=    os.Run And Return Rc And Output    echo test string
    Should Be Equal    ${rc}    ${0}
    Should Start With    ${result}    test string
    ${result} =    str.Strip String    ${result}
    Should Be Equal    ${result}    test string

02-space-escape
    ${rc}    ${result}=    os.Run And Return Rc And Output    echo test string
    ${len} =    Evaluate    len($result)
    ${x}=    Evaluate    ord($result[-1])
    Should Be Equal    ${rc}    ${0}    # check windows %errorlevel%
    Should Be Equal    ${result}    test string \
    Should Be Equal    ${result}    test string${SPACE}
    Should Be Equal    ${result}    test string ${EMPTY}
