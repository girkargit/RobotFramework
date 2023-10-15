*** Settings ***
Documentation    All the page object and keyword of landing page
Library    SeleniumLibrary
Resource    generic.robot

*** Variables ***
${shope_page_load}       css:.nav-link

*** Keywords ***
wait until element is located in the page
    # input data from generic file
    wait untill element passed is located on page   ${shope_page_load}

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