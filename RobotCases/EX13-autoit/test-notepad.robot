*** Settings ***
Library           AutoItLibrary    5    WITH NAME    autoit
Library           OperatingSystem    WITH NAME    os

*** Test Cases ***
new-save
    [Setup]    autoit.Run    notepad.exe
    Should Be True    ${True}
    autoit.Win Wait    [CLASS:Notepad]
    autoit.Control Send    [CLASS:Notepad]    ${EMPTY}    [CLASS:Edit]    This is some text.
    autoit.Win Menu Select Item    [CLASS:Notepad]    ${EMPTY}    &File    Save
    autoit.Win Wait    [CLASS:#32770]
    autoit.Win Activate    [CLASS:#32770]
    Sleep    1
    autoit.Control Send    [CLASS:#32770]    ${EMPTY}    [CLASS:Edit]    e:\\test.txt
    Sleep    1
    autoit.Control Click    [CLASS:#32770]    ${EMPTY}    [CLASS:Button; INSTANCE:2]
    ${has_save_as} =    Run Keyword And Return Status    autoit.Win Wait    [CLASS:#32770; TITLE:Confirm Save As]    ${EMPTY}    3
    Log    ${has_saveas}
    Run Keyword If    ${has_save_as}    autoit.Control Click    [CLASS:#32770; TITLE:Confirm Save As]    ${EMPTY}    [CLASS:Button; INSTANCE:1]
    autoit.Win Close    [CLASS:Notepad]
    autoit.Win Wait Close    [CLASS:Notepad]
    os.File Should Exist    e:\\test.txt
    ${file} =    os.Get File    e:\\test.txt
    Should Be Equal    ${file}    This is some text.
    [Teardown]    autoit.Win Close    [CLASS:Notepad]
