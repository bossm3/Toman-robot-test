*** Settings ***
Library           Collections
Library           SeleniumLibrary
Library           ../libs/main.py


*** Variables ***
${page}    ${1}
${per_page}    ${5}


*** Test Cases ***
Verify API Response for User List
    ${response}=   Try Request Users  page=${page}  per_page=${per_page}
    Should Be Equal As Numbers    ${response.status_code}    200   msg=Response status code is not 200
    ${body}=  set variable  ${response.json()}
    Should Be Equal As Numbers    ${body['page']}   1
    Should Be Equal As Numbers    ${body['per_page']}    5
    Should Be Equal As Numbers    ${body['total']}    12
    Should Be Equal As Numbers    ${body['total_pages']}    3
    ${data}=    Get From Dictionary    ${body}    data
    ${data_length}=    Get Length    ${data}
    Should Be Equal As Numbers   ${data_length}    5
    ${first_user}=    Get From List    ${data}    0
    Should Be Equal    ${first_user['email']}    george.bluth@reqres.in
    FOR    ${user}    IN    @{data}
        Dictionary Should Contain Key    ${user}    id
        Dictionary Should Contain Key    ${user}    first_name
        Dictionary Should Contain Key    ${user}    last_name
        Dictionary Should Contain Key    ${user}    avatar
    END
    ${last_user}=    Get From List    ${data}    -1
    Should Be Equal    ${last_user['email']}    charles.morris@reqres.in
    ${support}=    Get From Dictionary    ${body}    support
    Dictionary Should Contain Key    ${support}    url
    Dictionary Should Contain Key    ${support}    text
    Should Be Equal    ${response.headers['Content-Type']}    application/json; charset=utf-8

Verify Out Of Range Page for User List
    ${response}=   Try Request Users  page=9999
    Should Be Equal As Numbers    ${response.status_code}    200   msg=Response status code is not 200
    ${body}=  set variable  ${response.json()}
    ${data_length}=    Get Length    ${body['data']}
    should be equal as numbers  ${data_length}  0


Verify Resource API Response
    ${response}=   Try Request Resource
    Should Be Equal As Numbers    ${response.status_code}    200   msg=Response status code is not 200
    ${body}=  set variable  ${response.json()}
    Should Be Equal As Numbers    ${body['data']['id']}    1
    Should Be Equal    ${body['data']['name']}    cerulean
    Should Be Equal As Numbers    ${body['data']['year']}    2000
    Should Be Equal As Strings    "${body['data']['color']}"    "#98B2D1"
    Should Be Equal    ${body['data']['pantone_value']}    15-4020
    Should Be Equal    ${body['support']['url']}    https://contentcaddy.io?utm_source=reqres&utm_medium=json&utm_campaign=referral
    Should Be Equal    ${body['support']['text']}    Tired of writing endless social media content? Let Content Caddy generate it for you.