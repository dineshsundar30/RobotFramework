*** Settings ***
Documentation    Generic Setup and Elements

*** Variables ***
${REMOTE_URL}        http://127.0.0.1:4723
${PLATFORM_NAME}     Android
${DEVICE_NAME}       emulator-5554
${APP_PACKAGE}       com.android.contacts
${APP_ACTIVITY}      com.android.contacts.activities.PeopleActivity
${AUTOMATION_NAME}   UiAutomator2


*** Keywords ***
Open an Application
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=${AUTOMATION_NAME}
    Sleep    2s


Close an Application
    Close Application