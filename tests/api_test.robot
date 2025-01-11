*** Settings ***
Library           Collections
Library           SeleniumLibrary
Library           ../libs/main.py


*** Test Cases ***
Test API Returns 200 Status Code
    ${response}=   test search api response
    Should Be Equal As Numbers    ${response.status_code}    200   msg=Response status code is not 200
    ${body}=  set variable  ${response.json()}

Validate API Response Structure
    ${response}=   test search api response
    ${body}=  set variable  ${response.json()}
    Dictionary Should Contain Key    ${body}    status
    Dictionary Should Contain Key    ${body}    data
    Should Be Equal As Numbers    ${body["status"]}    200
    Dictionary Should Contain Key    ${body["data"]}    products
    Dictionary Should Contain Key    ${body["data"]}    filters
    ${products}=        Get From Dictionary    ${body["data"]}    products
    Should Be True      ${products}
    Should Be True      isinstance(${products}, list)

Validate Products Contain Required Fields
    ${response}=   test search api response
    ${body}=  set variable  ${response.json()}
    ${products}=       Get From Dictionary    ${body["data"]}    products

    FOR    ${product}    IN    @{products}
        Dictionary Should Contain Key    ${product}    id
        Dictionary Should Contain Key    ${product}    title_fa
        Dictionary Should Contain Key    ${product}    rating
    END