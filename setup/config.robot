*** Settings ***
Library           Collections
Library           SeleniumLibrary
Resource          constants.robot
Library           Collections
Library           OperatingSystem


*** Keywords ***
Configuration Chrome
    ${path_to_chrome_driver}=   Normalize Path   ${CURDIR}/../libs/chromedriver
        Open Browser    ${baseUrl}    browser=${platformName}
        ...    service=executable_path="${path_to_chrome_driver}"
    Set Selenium Timeout     20 seconds
    Set selenium implicit wait   60