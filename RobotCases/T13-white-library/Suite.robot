*** Settings ***
Library           WhiteLibrary    WITH NAME    white
Library           OperatingSystem    WITH NAME    os
Library           Collections

*** Variables ***
${TEST_TARGET_FILENAME}    d:\\test.txt

*** Test Cases ***
01-test-notebook
    [Setup]    white.Launch Application    notepad.exe
    os.Remove File    ${TEST_TARGET_FILENAME}
    @{windows} =     white.Get Application Windows
    Log List    ${windows}
    Length Should Be    ${windows}    1
    white.Attach Window    ${windows[0]}
    white.Input Text To Textbox    id:15    test string.
    white.Click Menu Button    text:File
    white.Click Menu Button    text:Save
    white.Select Modal Window    Save As
    white.Input Text To Textbox    id:1001    ${TEST_TARGET_FILENAME}
    white.Click Button    id:1
    os.File Should Exist    ${TEST_TARGET_FILENAME}
    ${file} =    os.Get File    ${TEST_TARGET_FILENAME}
    Should Be Equal    ${file}    test string.
    [Teardown]    white.Close Application
