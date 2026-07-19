*** Settings ***
Documentation    Using Resource To Dial a num in Contacts App
Library          AppiumLibrary
Resource         ../Resources/Generic.robot 
Test Setup       Open an Application
Test Teardown    Close an Application

*** Variables ***
${Search}    //android.widget.TextView[@content-desc='Search contacts'] 
${Search_input_ele}       //android.widget.EditText[@resource-id='com.android.contacts:id/search_view']
${Search_inp}    Tesapp1 
${Contact}    //android.widget.TextView[@content-desc='Tesapp1'] 
${Call_icon}    //android.widget.ImageView[@resource-id='com.android.contacts:id/icon']

*** Test Cases ***
Open Android Contacts App
    Click Element    ${Search}
    Input Text    ${Search_input_ele}    ${Search_inp}
    Wait Until Element Is Visible    ${Contact}
    Click Element    ${Contact}
    Wait Until Element Is Visible    ${Call_icon}
    Click Element    ${Call_icon}

Documentation    *** Variables ***
...  &{TestVariable}        name=dinesh    password=12345
... *** Test Cases ***
... Testing Variables
...     Log To Console    ${TestVariable}[name]
