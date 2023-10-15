*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
Library    String
Library    Collections
Test Setup    open the browser with the Mortgage payment url
Test Teardown   Close Browser
Resource    ../PO/generic.robot

*** Variables ***
${Error_Message_login}   xpath://div[@class='alert alert-danger col-md-12']

*** Test Cases ***
Validate child window functionality
    select the link of child window
    verify the user is switched to child window
    grab the email id in child window
    switch to parent window and enter the email

*** Keywords ***
select the link of child window
    Click Element    css:.blinkingText
    Sleep            5

verify the user is switched to child window
    Switch Window    NEW    # Switch to new window
    Element Text Should Be    css:h1       DOCUMENTS REQUEST

grab the email id in child window
    ${text}=    Get Text    css:.im-para.red
    @{words}=    Split String    ${text}     at     # Split method of list
    # 0 - Please email u
    #1 - mentor@rahulshettyacademy.com with below template to recive response
    ${text_split}=   Get From List   ${words}   1   # Return 1 index element from the list
    Log    ${text_split}
    @{words_2}=    Split String    ${text_split}        # By default delimeter consider as space
    # 0 - mentor@rahulshettyacademy.com
    ${email}=   Get From List   ${words_2}   0
    Set Global Variable    ${email}     # Variable set to global scope

switch to parent window and enter the email
    Switch Window    MAIN   # Return back to main window
    Title Should Be     LoginPage Practise | Rahul Shetty Academy
    Input Text      xpath://input[@id='username']   ${email}






