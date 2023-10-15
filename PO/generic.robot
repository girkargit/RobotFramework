*** Settings ***
Documentation    A resources file with resuable keywords and variables.
Library    SeleniumLibrary

*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}     123444
${valid_password}       learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome  C:\chrome_driver\chromedriver
    Go To               ${url}

# Multiple browser compatibility.
open the browser with the url
    [Arguments]    ${browser_name}
    Create Webdriver    ${browser_name}     resources/${browser_name}
    Go To               ${url}

close browsing session
    Close Browser

wait untill element passed is located on page
    [Arguments]    ${page_locator}
    Wait Until Element Is Visible   ${page_locator}