*** Settings ***
Library           Collections
Library           OperatingSystem
Library           SeleniumLibrary
Resource          ../setup/constants.robot
Resource          ../setup/config.robot
Library           ../libs/main.py

*** Test Cases ***
#Test valid search of Digikala
#    Configuration Chrome
#    Sleep    5
#    Wait Until Page Contains Element  ${search}  timeout=10
#    Click Element    ${search}
#    Wait Until Page Contains Element  ${search_input}  timeout=10
#    Input Text    ${search_input}    موبایل
#    Press Keys    ${search_input}   ENTER
#    Wait Until Page Contains Element  ${related_search}  timeout=10
#    ${elements}     Get WebElements    ${items}
#    ${count}        Get Length         ${elements}
#    Should Be True  ${count} > 15    The number of elements is not greater than 15
#    Close Browser

#Check Filter options of Digikala search page
#    Configuration Chrome
#    Sleep    5
#    Go To           https://www.digikala.com/search/?q=%D9%85%D9%88%D8%A8%D8%A7%DB%8C%D9%84
#    Wait Until Page Contains Element  ${related_search}  timeout=10
#    Element Should Contain    ${related_search}    موبایل سامسونگ
#    Element Should Contain    ${filter_box}    دسته‌بندی
#    Element Should Contain    ${filter_box}    برند
#    Element Should Contain    ${filter_box}    ارسال فردا
#    Element Should Contain    ${filter_box}    ارسال فروشنده
#    Element Should Contain    ${filter_box}    محدوده قیمت
#    Element Should Contain    ${filter_box}    فقط کالاهای موجود
#    Element Should Contain    ${filter_box}    فقط کالاهای موجود در انبار دیجی‌کالا
#    Element Should Contain    ${filter_box}    نوع فروشنده
#    Close Browser


#Check sort options of Digikala search page
#    Configuration Chrome
#    Sleep    5
#    Go To           https://www.digikala.com/search/?q=%D9%85%D9%88%D8%A8%D8%A7%DB%8C%D9%84
#    Element Should Contain    ${sort_box}    مرتبط‌ترین
#    Element Should Contain    ${sort_box}    پربازدیدترین
#    Element Should Contain    ${sort_box}    جدیدترین
#    Element Should Contain    ${sort_box}    پرفروش‌ترین‌
#    Element Should Contain    ${sort_box}    ارزان‌ترین
#    Element Should Contain    ${sort_box}    گران‌ترین
#    Element Should Contain    ${sort_box}    سریع‌ترین ارسال
#    Element Should Contain    ${sort_box}    پیشنهاد خریداران
#    Element Should Contain    ${sort_box}    منتخب
#    Close Browser


Check sort options of Digikala search page
    Configuration Chrome
    Sleep    5
    Go To           https://www.digikala.com/search/?q=%D9%85%D9%88%D8%A8%D8%A7%DB%8C%D9%84
    Wait Until Page Contains Element  ${elected_sort_btn}  timeout=10
    Click Element    ${elected_sort_btn}
    Element Should Contain    ${selected_sort}    منتخب
    Wait Until Page Contains Element  ${related_search}  timeout=10
    Sleep    5
    ${elements}     Get WebElements    ${items}
    ${count}        Get Length         ${elements}
    Should Be True  ${count} > 5    The number of elements is not greater than 5
    Close Browser