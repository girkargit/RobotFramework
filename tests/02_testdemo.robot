*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
Library    Collections
Test Setup      open the browser with the Mortgage payment url
#Test Teardown   close browsing session
Resource    ../PO/generic.robot

*** Variables ***
${Error_Message_login}   css:.alert-danger
${shope_page_load}       css:.nav-link

*** Test Cases ***
Validate UnSuccessful Login
    [Tags]      SMOKE
    fill the login form     ${user_name}    ${invalid_password}
    wait until element is located in the page       ${Error_Message_login}
    verify error message is correct

Validate card display in the shopping page
    fill the login form     ${user_name}    ${valid_password}
    wait until element is located in the page   ${shope_page_load}
    verify card title in the shope page
    select the card     Blackberry

select the form and nevigate to child window
    fill the login details and select user option

*** Keywords ***
fill the login form
    [Arguments]     ${username}    ${password}
    Input Text      xpath://input[@id='username']   ${username}
    Input Password  xpath://input[@id='password']   ${password}
    Click Button    xpath://input[@id='signInBtn']

wait until element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible   ${element}

verify error message is correct
    ${result}=  Get Text    ${Error_Message_login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be      ${Error_Message_login}     Incorrect username/password.

verify card title in the shope page
    @{expected_list}=    Create List     iphone X    Samsung Note 8      Nokia Edge      Blackberry
    ${elements}=     Get WebElements     xpath://h4[@class= 'card-title']   # four text have same locators so Get WebElements will return list
    @{actual_list}=     Create List    # empty list
     FOR    ${element}  IN      @{elements}
        Log    ${element.text}
        Append To List      ${actual_list}     ${element.text}
     END
    Lists Should Be Equal   ${actual_list}     ${expected_list}

select the card
    [Arguments]    ${card_name}
    ${elements}=     Get WebElements     xpath://h4[@class= 'card-title']
    ${index}=       Set Variable    1   # Assign a value to the variable
    FOR    ${element}  IN      @{elements}
        Exit For Loop If    '${element.text}' == '${card_name}'
        ${index}=   Evaluate  ${index} + 1
    END
    Click Button    (//button[@class='btn btn-info'])[${index}]

fill the login details and select user option
    Input Text      id:username     rahulshettyacademy
    Input Password    id:password   learning
    Click Element    css:input[value='user']    # for radio button like click element
    Wait Until Element Is Visible   css:.modal-body     #waiting for pop-up to click
    Click Element    xpath://button[@id='okayBtn']  #web pop-up
    Wait Until Element Is Not Visible   css:.modal-body     # wait untill pop-up is not shown
    Select From List By Value   xpath://select[@class='form-control']   teach   # for static drop down
    Select Checkbox     xpath://input[@id='terms']  # for selecting check box
    Checkbox Should Be Selected    xpath://input[@id='terms']   # verifing check box is selected or not

