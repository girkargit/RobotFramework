*** Settings ***
Documentation    All the page object and keyword of landing page
Library    SeleniumLibrary
Resource    generic.robot

*** Variables ***
${shope_page_load}       css:.nav-link

*** Keywords ***
enter the country
    [Arguments]    ${country_name}
    Input Text    xpath://input[@id='country']  ${country_name}
    Sleep    5
    wait untill element passed is located on page   //a[text()='${country_name}']   # go to the generic
    Click Element    xpath://a[text()='${country_name}']
    Click Element    xpath://label[@for='checkbox2']

puches the produc and confirm the purches
    Click Element    xpath://input[@value='Purchase']
    Page Should Contain    Success!