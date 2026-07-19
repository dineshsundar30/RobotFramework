*** Settings ***
Documentation    Generic Setup and Elements
Library          AppiumLibrary
*** Variables ***
${REMOTE_URL}        http://127.0.0.1:4723
${REMOTE_URL2}       http://127.0.0.1:4725
${PLATFORM_NAME}     Android
${DEVICE_NAME}       emulator-5554
${DEVICE_NAME2}       emulator-5556
${APP_PACKAGE}       com.android.contacts
${APP_ACTIVITY}      com.android.contacts.activities.PeopleActivity
${AUTOMATION_NAME}   UiAutomator2
${APP2_PACKAGE_name}    com.expandtesting.practice
${APP2_ACTIVITY_Name}    com.expandtesting.practice.MainActivity


*** Keywords ***
Open an Application
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    #...    deviceName=${DEVICE_NAME}        Device name is optional
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=${AUTOMATION_NAME}
    Sleep    2s


Close an Application
    Close Application


#*** For Appiumtest3 test

Open new Application
    [Arguments]    ${APP_PACKAGE_name}    ${APP_ACTIVITY_Name}
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE_Name}
    ...    appActivity=${APP_ACTIVITY_Name}
    ...    automationName=${AUTOMATION_NAME}



#*** For Appiumtest4 test

Open an Application Setup for Multidevice
    [Arguments]        ${REMOTE_URL_PORT}=http://127.0.0.1:4723       ${DEVICE}=${DEVICE_NAME}
    Open Application    ${REMOTE_URL_PORT}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE}    #If we starts the appium with default capabilities to open multiple instances we don't have to pass that here   #juse these 4 is enough
    ...    appPackage=${APP2_PACKAGE_Name}
    ...    appActivity=${APP2_ACTIVITY_Name}
    ...    automationName=${AUTOMATION_NAME}
    Log    ${REMOTE_URL_PORT}
    Log    ${DEVICE}

Open new Application for First Device
    Open an Application Setup for Multidevice

Open new Application for Second Device
    Open an Application Setup for Multidevice    ${REMOTE_URL2}    ${DEVICE_NAME2}

Set Timeout
    Set Appium Timeout    10s
