*** Settings ***
Documentation    This is an automated test for Task 1 of the Click Tripz Automation Architecture Test: Hotel Citywide

Resource          resource-Chrome.robot
Suite Setup       Set up
Suite Teardown    Close All Browsers

*** Variables ***
${BROWSER}              Chrome
${URL}                  https://www.clicktripz.com/test.php
${CITY}                 xpath=//label[contains(text(), "City")]/following-sibling::div/input
${CHECKIN}              xpath=//label[contains(text(), "Check-in")]/following-sibling::div/input
${CHECKINDATEPICKER}    xpath=//div[@id='ui-datepicker-div']
${CHECKOUT}             xpath=//label[contains(text(), "Check-out")]/following-sibling::div/input
${DATEPICKER}           xpath=//div[@id='ui-datepicker-div']
${GUESTS}               xpath=//label[contains(text(), "Guests")]/following-sibling::div/select
${ROOMS}                xpath=//label[contains(text(), "Rooms")]/following-sibling::div/select
${SEARCHBUTTON}         xpath=//button[contains(text(), "Search Hotels")]

*** Test Cases ***
Change City
    Log    This keyword will change the default text in the City field to the desired text passed to the Input Text sub keyword.
    Wait Until Element Is Visible    ${CITY}    10
    Clear Element Text    ${CITY}
    Input Text    ${CITY}    Manhattan Beach, CA

Change Check-In Date
    Log    This keyword will change the Check-In date on the Check-In field.
    Wait Until Element Is Visible    ${CHECKIN}
    Click Button    ${CHECKIN}
    Wait Until Element Is Visible    ${DATEPICKER}
    Log   Friday the 13th 2018 is the day to be selected
    Click Element    xpath=//div[@id='ui-datepicker-div']/descendant::a[contains(text(), '13')]
    Wait Until Element Is Not Visible    ${DATEPICKER}

Change Check-Out Date
    Log    This keyword will change the Check-Out date on the Check-Out field.
    Wait Until Element Is Visible    ${CHECKOUT}
    Click Button    ${CHECKOUT}
    Wait Until Element Is Visible    ${DATEPICKER}
    Log   Sunday the 15th 2018 is the day to be selected
    Click Element    xpath=//div[@id='ui-datepicker-div']/descendant::a[contains(text(), '15')]
    Wait Until Element Is Not Visible    ${DATEPICKER}

Set number of Guests
    Log    This keyword will set the number of Guests to 2
    Wait Until Element is Visible    ${GUESTS}
    Select From List    ${GUESTS}    2

Search Hotels
    Wait Until Element Is Visible    ${SEARCHBUTTON}
    Click Button    ${SEARCHBUTTON}

Minimize main window
    Minimize Window

Switch to Exit Unit Window
    Log    This keyword will Switch windows
    #The main window is indexed as 0. The secondary window can be selected by passing 1 to Change window.
    Change Windows    1
    Capture Page Screenshot    clicktripz_hotel_ad_window_1.png

Click Show me the first deal and maximize window
    Wait Until Element is Visible    ${SHOWMEBUTTON}
    Click Element    ${SHOWMEBUTTON}
    #Maximize Browser Window
    Sleep    2
    Capture Page Screenshot    clicktripz_hotel_ad_window_2.png

Click through Travel agency tabs
    Wait Until Element Is Visible    ${TABXPATH}
    ${x}=       Get Matching Xpath Count    ${TABXPATHCOUNT}
    ${AllTabs}=    Evaluate    ${x}+1
    :FOR    ${tabs}    IN RANGE    1    ${AllTabs}
    \    ${StartingWindows}    Get Window Titles
    \    Run Keyword And Ignore Error    Select Window    @{StartingWindows}[1]
    \    Wait Until Element Is Visible    ${TABXPATH}    10
    \    Click Element    ${LI}[${tabs}]/${A}
    \    Sleep    5
    \    ${windows}    Get Window Titles
    \    ${StartingWindowCount}    Get Length    ${StartingWindows}
    \    ${NewWindowCount}    Get Length    ${windows}
    \    ${IndexedWindow}    Evaluate    ${NewWindowCount}-1
    \    Run Keyword If    ${NewWindowCount} > ${StartingWindowCount}    Select Window    @{windows}[${IndexedWindow}]
    \    Capture Page Screenshot    clicktripz_hotel_ad_tab_${tabs}.png

Capture URL of Exit Unit
    Exit Unit URL Capture

*** Keywords ***
Set up
    Open Browser and Go to URL    ${URL}
