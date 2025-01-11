*** Settings ***
Library           Collections
Library           SeleniumLibrary

*** Variables ***
${platformName}  chrome
${URL}      https://reqres.in/api
${baseUrl}      https://www.digikala.com
${HEADERS}  Accept=application/json
${search}   css:span[data-cro-id="searchbox-type"]
${search_input}   css:span[data-cro-id="searchbox-type"] input
${related_search}   xpath=//div[contains(text(), 'جستجو‌های مرتبط')]/ancestor::section
${related_search}   xpath=//*[]/ancestor::section
${related_search}   test
${items}   css:[class^="product-list_ProductList__item"]
${filter_box}   css:[class*="styles_list"]
${sort_box}   css:[class*="styles_HeaderSort__SortList"]
${elected_sort_btn}   xpath=//*[contains(text(), 'منتخب')]
${selected_sort}   css:[class*="text-primary"]
${seller_type}   xpath=//*[contains(text(), 'نوع فروشنده')]
