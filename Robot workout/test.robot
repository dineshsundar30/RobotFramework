*** Settings ***
Documentation    To Dashboard validation
Library    SeleniumLibrary
Resource    resource.robot
Library    Function.py
#Test Setup    clear cookies
#Test Teardown    clear cookies

*** Test Cases ***
Widget validation
    login into the dashboard    admin    P@ssw0rd    http://10.78.100
    select the dws dashboard
    Navigating to the page Category    xpath:(//div[@class='dwsLeftNavIconContainer'])[3]
    Scroll Widget Into View    xpath://p[text()=' Device Privileges Summary ']
    # here add the webelements which you what to get the data from the dashboard
    #${list_of_locators}=    Create List    xpath://div[@class='oldBIOS-container']    xpath://div[@class='latestBIOS-container']
    