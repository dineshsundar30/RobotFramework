*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     DataDriver      file=resources/data.csv     encoding=utf_8   dialect=unix        #this may vary for user bases on OS
Test Teardown   Close Browser
Test Template   Validate UnSuccesful Login


*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***
Login with user ${username} and password ${password}        xyc     123456         #that ${varialbe name} should be match with the csv columns name and xyc and 123 is option if any error that will run
                                                                              #if we don't give a test case name in csv for that test name will be create in this given formate

*** Keywords ***
Validate UnSuccesful Login
    [Arguments]     ${username}     ${password}            # in csv also that column name should match including that ${} 
    open the browser with the Mortgage payment url
    Fill the login Form    ${username}      ${password}
    wait until it checks and display error message
    verify error message is correct

open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=/Users/rahulshetty/Documents/chromedriver
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    [arguments]     ${username}     ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible       ${Error_Message_Login}

verify error message is correct
   ${result}=   Get Text    ${Error_Message_Login}
   Should Be Equal As Strings     ${result}     Incorrect username/password.
   Element Text Should Be       ${Error_Message_Login}      Incorrect username/password.
















