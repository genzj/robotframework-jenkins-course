*** Settings ***
Library           AppiumLibrary    run_on_failure=Log Source

*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_VER}    7

*** Keywords ***
TestStart
    [Documentation]    just demo
    ...
    ...    Test with Appium-windows-1.18.3, AVD+Android 7.1.1
    Open Application    ${REMOTE_URL}    platformName=Android    platformVersion=${PLATFORM_VER}    deviceName=Emulator    app=${CURDIR}/demoapp/OrangeDemoApp.apk    automationName=UIAutomator2    appPackage=com.netease.qa.orangedemo
    Capture Page Screenshot
