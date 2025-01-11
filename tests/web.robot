*** Settings ***
Library           Collections
Library           OperatingSystem
Library           SeleniumLibrary
Resource          ../setup/constants.robot
Resource          ../setup/config.robot
Library           ../libs/main.py

*** Test Cases ***
Test search of Digikala
    Configuration Chrome
    Sleep    5
    Wait Until Page Contains Element  ${search}  timeout=10
    Click Element    ${search}
    Wait Until Page Contains Element  ${search_input}  timeout=10
    Input Text    ${search_input}    موبایل
    Press Keys    ${search_input}   ENTER
    Wait Until Page Contains Element  ${related_search}  timeout=10
    Element Should Contain    ${related_search}    موبایل سامسونگ
    Scroll Element Into View  ${seller_type}
    Capture Page Screenshot    screenshot.png
    Sleep    100