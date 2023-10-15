*** Settings ***
Documentation    All the page object and keyword of landing page
Library    SeleniumLibrary
Resource    generic.robot

*** Variables ***
${Error_Message_login}   css:.alert-danger

*** Keywords ***
fill the login form
    [Arguments]     ${username}    ${password}
    Input Text      xpath://input[@id='username']   ${username}
    Input Password  xpath://input[@id='password']   ${password}
    Click Button    xpath://input[@id='signInBtn']

wait until element is located in the page
    # input data from generic file
    wait untill element passed is located on page   ${Error_Message_login}

verify error message is correct
    ${result}=  Get Text    ${Error_Message_login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be      ${Error_Message_login}     Incorrect username/password.

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
