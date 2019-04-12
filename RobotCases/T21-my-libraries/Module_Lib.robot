*** Settings ***
Library           ../libs/MyLib.py

*** Test Cases ***
say hello to world
    Say Hello    world
    Print Count

say again
    Say Hello    again
    Print Count

call other keyword
    Open Baidu

should be nice
    Run Keyword And Expect Error    *    Should Be Nice    aaa
