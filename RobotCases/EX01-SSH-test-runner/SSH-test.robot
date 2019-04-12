*** Settings ***
Library           SSHLibrary    WITH NAME    ssh

*** Variables ***
${host}           192.168.32.130
${username}       atc
${password}       1234

*** Test Cases ***
SSH test
    [Setup]    Open Connection And Login    ${host}    ${username}    ${password}
    ${stdout}    ${stderr}    ${rc} =    ssh.Execute Command    echo test string    return_rc=${TRUE}    return_stderr=${TRUE}
    Log    ${stdout}
    Log    ${stderr}
    Should Be Equal    ${rc}    ${0}
    Should Be Equal    ${stdout}    test string
    [Teardown]    ssh.Close All Connections

*** Keywords ***
Open Connection And Login
    [Arguments]    ${host}    ${username}    ${password}
    ssh.Open Connection    ${host}
    ssh.Login    ${username}    ${password}
