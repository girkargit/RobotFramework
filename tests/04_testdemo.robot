*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
Test Template    Validate UnSuccessful Login
Test Teardown   Close Browser
#In parameterized test case test case also declear in kewords and in test case section parameterized test case
#should written.


*** Variables ***
${Error_Message_login}   xpath://div[@class='alert alert-danger col-md-12']

*** Test Cases ***      username        password
Invalid username        njnjndj         learning
Invalid password        rahulshetty     dcksdd
special character       @#g           learning

*** Keywords ***
Validate UnSuccessful Login
    [Arguments]    ${username}      ${password}
    open the browser with the Mortgage payment url
    fill the login form     ${username}    ${password}
    wait until it check and display error message
    verify error message is correct

open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

fill the login form
    [Arguments]     ${username}    ${password}
    Input Text      xpath://input[@id='username']   ${username}
    Input Password  xpath://input[@id='password']   ${password}
    Click Button    xpath://input[@id='signInBtn']

wait until it check and display error message
    Wait Until Element Is Visible   ${Error_Message_login}

verify error message is correct
    ${result}=  Get Text    ${Error_Message_login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    # Another way
    Element Text Should Be      ${Error_Message_login}     Incorrect username/password.



