*** Settings ***
Resource         ../Resources/Generic.robot
Test Teardown    Close Application
*** Variables ***
${Gesture_demo_button}    com.expandtesting.practice:id/btn_gesture_demo
${Tap}        com.expandtesting.practice:id/btnTap
${Tap_message}        com.expandtesting.practice:id/tvTapResult
${swip_result}        com.expandtesting.practice:id/tvSwipeMeResult


*** Test Cases ***
Mobile Gesture Test
    Open an Application
    #Wait Until Element Is Visible    ${Balance_Check}    10s
    Click Element    ${Gesture_demo_button}

    #Tap
    Wait Until Element Is Visible    ${Tap}
    Click Element    ${Tap}
    ${Tamp_Output}=    Get Text    ${Tap_message}
    Log    ${Tamp_Output}


    # Left to right swipes (Y remains same)
    Swipe    166    566    919    558    1000
    ${text}=    Get Text    ${swip_result}
    Log To Console    After swipe 1 (L-R): ${text}

    Swipe    166    566    919    558    1000
    ${text}=    Get Text    ${swip_result}
    Log To Console    After swipe 2 (L-R): ${text}

    Swipe    166    566    919    558    1000
    ${text}=    Get Text    ${swip_result}
    Log To Console    After swipe 3 (L-R): ${text}


    # Upward swipes (X remains same)
    Swipe    514    600    514    200    1000
    ${text}=    Get Text    ${swip_result}
    Log To Console    After swipe 1 (Up): ${text}

    Swipe    514    600    514    200    1000
    ${text}=    Get Text    ${swip_result}
    Log To Console    After swipe 2 (Up): ${text}

    Swipe    514    600    514    200    1000
    ${text}=    Get Text    ${swip_result}
    Log To Console    After swipe 3 (Up): ${text}

    Sleep    15s
