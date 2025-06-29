*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     String
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser
Library     Collections
Resource        ../PO/Generic.robot


*** Variables ***
${Error_Message_Login}      css:.alert-danger



*** Test Cases ***
Validate Child window Functionality
    [Tags]      NEWFEATURE
    Select the link of Child window
    Verify the user is Switched to Child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email


*** Keywords ***
Select the link of Child window
    click element       css:.blinkingText
    Sleep               5

Verify the user is Switched to Child window
    switch window       NEW
    Sleep               5            # we can prefer sleep after switching into new window insted of verifying few elemeny's is presented 
    Element Text Should Be       css:h1     DOCUMENTS REQUEST


Grab the Email id in the Child Window
    ${text}=    get text    css:.red
    @{words}=   Split String    ${text}     at
    #0 ->Please email u
    #1-> mentor@rahulshettyacademy.com with below template to receive response
    ${text_split}=      Get From List       ${words}    1
    log     ${text_split}
     @{words_2}=   Split String    ${text_split}                   #if we don't give any string for splict it automatically take wightspace for split
     #0->mentor@rahulshettyacademy.com
     ${email}=      Get From List    ${words_2}    0
     Set Global Variable         ${email}                #if we need to use one variable in other test, which is declear inside one test we can use this Set Global Variable 


Switch to Parent window and enter the Email
    switch window       MAIN                                   # we can move to mail with this
    Title Should Be     LoginPage Practise | Rahul Shetty Academy
    Input Text          id:username     ${email}


[Documentation]
... there are few method here to switch windows

... Switch Window    title=New Tab Title
... Switch Window    url=example.com/newpage
... Switch Window    index=1
... Switch Window                                        #by default this will open last windows










































