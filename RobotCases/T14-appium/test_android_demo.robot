*** Settings ***
Documentation     demo for appium library
Resource          demo_resoure.robot

*** Test Cases ***
test_demo
    [Setup]    TestStart
    Click A Point    200    200
    Page Should Contain Element    id=com.netease.qa.orangedemo:id/textView1
    Element Should Contain Text    id=com.netease.qa.orangedemo:id/textView1    TextView
    Click Element    id=com.netease.qa.orangedemo:id/imageButton1
    Capture Page Screenshot
    [Teardown]    Close All Applications
