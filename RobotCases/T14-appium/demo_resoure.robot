*** Settings ***
Library           AppiumLibrary    run_on_failure=Log Source

*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_VER}    5

*** Keywords ***
TestStart
    [Documentation]    just demo
    Open Application    ${REMOTE_URL}    platformName=Android    platformVersion=${PLATFORM_VER}    deviceName=Emulator    app=${CURDIR}/demoapp/OrangeDemoApp.apk    automationName=appium    appPackage=com.netease.qa.orangedemo
    Capture Page Screenshot
