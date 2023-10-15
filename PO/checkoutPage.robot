*** Settings ***
Documentation    All the page object and keyword of landing page
Library    SeleniumLibrary
Library    Collections
Resource    generic.robot

*** Variables ***


*** Keywords ***

verify item in the checkout page and proceed
#    @{element_list}=     Create List    Nokia Edge   Blackberry
#    @{actual_list}=     Create List
#    ${element}=     Get Webelements     xpath://tbody/tr/td/div/div/h4/a
#    FOR    ${name}    IN      ${element}
#        ${temp}=    Get Text    ${name}
#        Append To List      ${actual_list}      ${temp}
#    END
#    Lists Should Be Equal       ${element_list}     ${actual_list}
    Click Element    xpath:(//button[@type='button'])[5]

