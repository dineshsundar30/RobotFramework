*** Settings ***
Documentation    for function grouping
Library    SeleniumLibrary
Library    Function.py
Library    Collections
Library    Dialogs


*** Variables ***
${WAIT_TIME}    30s
${username_element}    css:input[id='username']
${password_element}    css:input[id='password']
${login-popup}    css:div[class='pull-right']
${dashboard_popup}    css:.btn.cookie-consent-agreement
${dws-dashboard}    xpath://*[contains(text(), 'Digital Workspace')]
${backbutton}    css:.backToDWSContext-img
${map}    css:.col-xs-2 > .cursor-pointer
${govern}    css:.govern-toggle-icon-hover > .link
*** Keywords ***


login into the dashboard
    [Arguments]    ${username}    ${password}    ${url}
    ${options}=    Get Chrome Options
    Open Browser    ${url}    Chrome    options=${options}
    Wait Until Element Is Visible    ${username_element}
    Input Text    ${username_element}    ${username}
    Input Password    ${password_element}    ${password}
    Sleep    1s
    Double Click Element    ${login-popup}
    ${Captcha} =  Get Value From User    Enter the captcha
    Input Text    css:input[id='captchaText']    ${Captcha}
    Sleep    2s
    Double Click Element       id=signin

select the dws dashboard
    Wait Until Page Contains Element    ${map}    ${WAIT_TIME}
    Click Element    ${map}
    Sleep    1s
    Wait Until Page Contains Element    ${govern}
    Click Element    ${govern}
    Sleep    1s
    Wait Until Page Contains Element    ${dws-dashboard}    ${WAIT_TIME}
    Scroll Element Into View    ${dws-dashboard}
    Click Element    ${dws-dashboard}
    Sleep    5s    #if category is not selected properly increase this
    Wait Until Element Is Visible    ${dashboard_popup}    ${WAIT_TIME}
    #Click Element    css:.btn.cookie-consent-agreement
    Double Click Element    ${dashboard_popup}

Navigating to the page Category
    [Arguments]    ${pageCategory}
    Wait Until Element Is Visible    ${pageCategory}    ${WAIT_TIME}
    Click Element    ${pageCategory}
    Sleep    5s

Scroll Widget Into View
    [Arguments]    ${widget}
    Scroll Element Into View    ${widget}

Get text from multiple locators
    [Arguments]    ${list_of_locators}
    Log    ${list_of_locators}

    FOR    ${locator}    IN    @{list_of_locators}

        Log    ${locator}
        Sleep    2s
        #${elements}=    Get Webelements    ${locator}
        #Log    ${elements}
        Wait Until Page Contains Element    ${locator}    ${WAIT_TIME}
        Scroll Element Into View    ${locator}
        Click Element    ${locator}
        Sleep    2s
        @{tablebody}=    get_table_body
        Log    ${tablebody}
        #@{table_body}    Create List

        #@{rows}    Find Element    xpath://tbody//div//tr
        #FOR    ${row}    IN    @{rows}
        #    @{row_data}=    Create List

        #   #@{cells}=    Get Webelements   xpath://td    parent=${row}
        #    @{cells}=    Find Element    xpath://td    xpath://tbody//div//tr
        #    FOR    ${cell}    IN    @{cells}
        #       ${cell_text}=    Get Text    ${cell}
        #        Append To List    ${row_data}    ${cell_text}
        #        log     ${row_data}
        #    END
        #END
        #Get Text
        Wait Until Page Contains Element    ${backbutton}
        Click Element    ${backbutton}
        Sleep    2s
    END














clear cookies
    Execute JavaScript    window.localStorage.clear();
    Execute JavaScript    window.sessionStorage.clear();
    Delete All Cookies