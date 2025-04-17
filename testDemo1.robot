*** Settings ***
Documentation   To validate the Login form       # this for documanting and we need to use one tab after the keyword
Library     SeleniumLibrary
Test Teardown   Close Browser #it will execute after the all test cases


*** Variables ***
${Error_Message_Login}      css:.alert-danger  #double tab


*** Test Cases ***                # in robot framework test cases is a collection of key words
Validate UnSuccesful Login        # this like a test heading or parent testcase we need to write the keyword under this name
    open the browser with the Mortgage payment url      # we can use any bussiness key words for this 
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=/Users/rahulshetty/Documents/chromedriver      #in updated selenium this executable_path step is not required we can skip this path 
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text          id:username     rahulshettyacademy            #robot will support only id,css,xpath for ID we can skip name and directly pass the locator
    Input Password      id:password     12345678
    Click Button        signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible       ${Error_Message_Login}            # for this kind of code we can refer the builtin library and here if we not over write the wait time default is library 5 seconds  

verify error message is correct
   ${result}=   Get Text    ${Error_Message_Login}   #here if you don't use a one tab after the equal it will through error 
   Should Be Equal As Strings     ${result}     Incorrect username/password.
   Element Text Should Be       ${Error_Message_Login}      Incorrect username/password.
















