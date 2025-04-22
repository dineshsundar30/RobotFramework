*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
Library     ../customLibraries/Shop.py
Test Setup      open the browser with the url  #this will run before every test cases
Suite Setup          # this will run once before starting of the file 
Suite Teardown       # this will run once after ending of the file 
Test Teardown   Close Browser session          #this will run after every test cases
Resource        ../PO/Generic.robot          #here we change that resource file into generic.robot we can name anythong here
Resource        ../PO/LandingPage.robot
Resource        ../PO/ShopPage.robot
Resource        ../PO/CheckoutPage.robot
Resource        ../PO/ConfirmationPage.robot


*** Variables ***
@{listofProducts}           Blackberry      Nokia Edge
${country_name}             India


*** Test Cases ***
Validate UnSuccesful Login
     [Tags]      SMOKE      REGRESSION
     LandingPage.Fill the login Form     ${user_name}    ${invalid_password}               #here to avoide the conflict we can use that filename that contain the keyword
     LandingPage.wait until Element is located in the page
     LandingPage.verify error message is correct



End to end ecommerce Product validation
    [Tags]      REGRESSION
    LandingPage.Fill the login Form     ${user_name}    ${valid_password}
    ShopPage.wait until Element is located in the page
    ShopPage.Verify Card titles in the Shop page
    add items to cart and checkout      ${listofProducts}
    CheckoutPage.Verify items in the Checkout Page and proceed
    ConfirmationPage.Enter the Country and select the terms      ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase



Select the Form and navigate to Child window
    LandingPage.Fill the Login Details and Login Form










































