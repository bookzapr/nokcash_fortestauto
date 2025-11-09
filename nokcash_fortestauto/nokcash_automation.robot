*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    https://ลอตเตอรี่พลัส.com/    chrome
Suite Teardown    Close Browser

*** Variables ***
${URL_HOME}        https://ลอตเตอรี่พลัส.com/
${AMOUNT_FIELD}    data-testid = nok-cash-amount-input
${SUBMIT_BTN}      data-testid = nok-cash-top-up-button
${BANNER_XPATH}    data-testid = nok-more-nok-cash-icon
${CLOSE_ICON}      data-testid = close-button

*** Test Cases ***

TC02_คลิก Banner เพื่อเข้าสู่หน้า Top-up NokCash
    Go To    ${URL_HOME}
    Wait Until Element Is Visible     ${CLOSE_ICON}     5s
    Click Element    ${CLOSE_ICON}    
    Wait Until Element Is Visible    ${BANNER_XPATH}    10s
    Click Element    ${BANNER_XPATH}
    Wait Until Location Contains    nokcash    10s
    Page Should Contain    เติมเงิน NokCash

TC03_กรอกยอดเติมเงินถูกต้อง (Positive)
    Go To    ${URL_HOME}
    Wait Until Element Is Visible     ${CLOSE_ICON}     5s
    Click Element    ${CLOSE_ICON}  
    Click Element    ${BANNER_XPATH}
    Input Text    ${AMOUNT_FIELD}    100
    Click Button    ${SUBMIT_BTN}
    Wait Until Page Contains    Order Summary    10s
    Page Should Contain    100

TC05_กรอกยอดต่ำกว่าขั้นต่ำ (Boundary)
    Go To    ${URL_HOME}
    Wait Until Element Is Visible     ${CLOSE_ICON}     5s
    Click Element    ${CLOSE_ICON}  
    Click Element    ${BANNER_XPATH}
    Input Text    ${AMOUNT_FIELD}    1
    Click Button    ${SUBMIT_BTN}
    Page Should Contain    จำนวนเงินไม่ถูกต้อง

TC05_กรอกยอดเกินขีดจำกัดสูงสุด
    Go To    ${URL_HOME}
    Wait Until Element Is Visible     ${CLOSE_ICON}     5s
    Click Element    ${CLOSE_ICON}  
    Click Element    ${BANNER_XPATH}
    Input Text    ${AMOUNT_FIELD}    3000000
    Click Button    ${SUBMIT_BTN}
    Page Should Contain    จำนวนเงินไม่ถูกต้อง


TC08_กรอกอักษรแทนตัวเลข
    Go To    ${URL_HOME}
    Wait Until Element Is Visible     ${CLOSE_ICON}     5s
    Click Element    ${CLOSE_ICON}  
    Click Element    ${BANNER_XPATH}
    Input Text    ${AMOUNT_FIELD}    abc
    Click Button    ${SUBMIT_BTN}
    Page Should Contain    กรุณากรอกตัวเลขเท่านั้น

