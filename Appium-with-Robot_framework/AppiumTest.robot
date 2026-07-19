*** Settings ***
Documentation    Our First Appium robot Test File To Open Application
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}        http://127.0.0.1:4723
${PLATFORM_NAME}     Android
${DEVICE_NAME}       emulator-5556
${APP_PACKAGE}       com.android.contacts
${APP_ACTIVITY}      com.android.contacts.activities.PeopleActivity
${AUTOMATION_NAME}   UiAutomator2												#this is also importent this is to specify which webdriver our appium should use 

*** Test Cases ***
Open Android Contacts App
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=${AUTOMATION_NAME}
    Sleep    5s
    Close Application
