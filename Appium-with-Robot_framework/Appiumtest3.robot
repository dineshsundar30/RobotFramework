*** Settings ***
Documentation    With commom open application and running keywords if condition meet
...   Here we have only 2 keywords in testcase but test case 2 we have some condition if that meet it automatically run the second keyword
...
Library          AppiumLibrary
Resource         ../Resources/Generic1.robot
Suite Setup    Set Timeout
Test Teardown    Close an Application

*** Variables ***
${Expand_bank}    //android.widget.Button[@content-desc='go-to-bank-screen']  
${Username_field}    //android.widget.EditText[@resource-id="com.expandtesting.practice:id/usernameTextField"]
${Password_field}    //android.widget.EditText[@resource-id="com.expandtesting.practice:id/passwordTextField"]
${Login_button}    //android.widget.Button[@resource-id="com.expandtesting.practice:id/loginButton"]
${Balance_Check}    id=com.expandtesting.practice:id/tvBalance
${Make_payment_button}    id=com.expandtesting.practice:id/makePaymentButton
${Phone_input_field}     id=com.expandtesting.practice:id/phoneTextField
${Name_input_field}     id=com.expandtesting.practice:id/nameTextField
${Amount_input_field}    id=com.expandtesting.practice:id/amountTextField
${select_country}        id=com.expandtesting.practice:id/countryButton 
${Country}        //android.widget.TextView[@resource-id="com.expandtesting.practice:id/rowTextView" and @text="France"]
${Send_payment_button}    id=com.expandtesting.practice:id/sendPaymentButton

*** Test Cases ***
Testing the Bank and login
    Open a Application
    Select the Bank Option and Login

*** Keywords ***
Open a Application
    Open new Application    com.expandtesting.practice    com.expandtesting.practice.MainActivity

Select the Bank Option and Login
    Wait Until Element Is Visible    ${Expand_bank}    2s
    Click Element    ${Expand_bank}
    Input Text    ${Username_field}    practice
    Input Text    ${Password_field}    practice
    Click Element    ${Login_button}
    Wait Until Element Is Visible    ${Balance_Check}    10s
    Element Should Contain Text    ${Balance_Check}    100.00
    ${Balance_text}=    Get Text    ${Balance_Check}
    ${Balance}=    Run Keyword And Return Status    Should Contain    ${Balance_text}    100.00
    log    ${Balance}
    Log To Console    ${Balance}
    #Run Keyword If    ${Balance}=='False'    Transfer the Money                #Here this will not work This issue typically happens because of how Robot Framework compares strings and booleans. so here we are comparing the staring in below line
    Run Keyword If    ${Balance} == True    Transfer the Money

Transfer the Money
    Click Element    ${Make_payment_button}
    Input Text    ${Phone_input_field}    123456789 
    Input Text    ${Name_input_field}     Dineshkumar S
    Input Text    ${Amount_input_field}    10
    Click Element    ${select_country}
    Wait Until Element Is Visible    ${Country}    10s
    #Scroll Element Into View    xpath=${Country}
    Click Element    ${Country}
    Click Element    ${Send_payment_button}

  
