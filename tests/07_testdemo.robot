# Implementing page object
*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
Library    Collections
Library    ../custom_library/Shop.py
#Test Setup      open the browser with the Mortgage payment url
Test Setup      open the browser with the url    Chrome
#Test Teardown   close browsing session
Resource    ../PO/generic.robot
Resource    ../PO/ShopPage.robot
Resource    ../PO/LandingPage.robot
Resource    ../PO/checkoutPage.robot
Resource    ../PO/confirmation.robot

*** Variables ***
@{list_of_product}       Blackberry     Nokia Edge
${country_name}     India

*** Test Cases ***
#Validate UnSuccessful Login
#    LandingPage.fill the login form     ${user_name}    ${invalid_password}
#    LandingPage.wait until element is located in the page
#    LandingPage.verify error message is correct

Validate card display in the shopping page
    LandingPage.fill the login form     ${user_name}    ${valid_password}   # Keyword fatch from LandingPage file
    ShopPage.wait until element is located in the page
    ShopPage.verify card title in the shope page
    Add Item To Card And Checkout       ${list_of_product}
    checkoutPage.verify item in the checkout page and proceed
    confirmation.Enter The Country    ${country_name}
    confirmation.puches the produc and confirm the purches


#select the form and nevigate to child window
#    LandingPage.fill the login details and select user option


