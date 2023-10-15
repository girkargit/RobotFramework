*** Settings ***
# To create module name required thtree star at start and end
Documentation   To validate the login form
# Overall description
Library     SeleniumLibrary
# Library required for selenium
Test Teardown   Close Browser
# This keyword run at the end of the script

*** Variables ***
${Error_Message_login}   xpath://div[@class='alert alert-danger col-md-12']

*** Test Cases ***
Validate UnSuccessful Login
    open the browser with the Mortgage payment url
    fill the login form
    wait until it check and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome  C:\chrome_driver\chromedriver
    Go To    https://rahulshettyacademy.com/loginpagePractise/
fill the login form
    Input Text      xpath://input[@id='username']   rahulshettyacademy
    Input Password  xpath://input[@id='password']   test123
    Click Button    xpath://input[@id='signInBtn']
wait until it check and display error message
    Wait Until Element Is Visible   ${Error_Message_login}
verify error message is correct
    ${result}=  Get Text    ${Error_Message_login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    # Another way
    Element Text Should Be      ${Error_Message_login}     Incorrect username/password.



