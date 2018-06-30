*** Settings ***
Documentation    This is an automated test for Task 2 of the Click Tripz Automation Architecture Test: Flights

Resource          resource-Chrome.robot
Suite Setup       Set up
Suite Teardown    Close All Browsers

*** Variables ***
${BROWSER}          Chrome
${URL}              https://www.clicktripz.com/test.php
${FLIGHTSTAB}       xpath=//a[contains(text(), 'Flights')]
${FROM}             xpath=//label[contains(text(), 'From')]/following-sibling::div[1]/input
${TO}               xpath=//label[contains(text(), 'To')]/following-sibling::div[1]/input
${DEPARTING}        xpath=//label[contains(text(), 'Departing')]/following-sibling::div[1]/input
${RETURNING}        xpath=//label[contains(text(), 'Returning')]/following-sibling::div[1]/input
${DATEPICKER}       xpath=//div[@id='ui-datepicker-div']
${TRAVELERS}        xpath=//label[contains(text(), 'Travelers')]/following-sibling::div/select
${SEARCHBUTTON}     xpath=//button[contains(text(), 'Search')]

*** Test Cases ***
Switch to Flights Tab
    Log    This keyword sets the experience to the Flights tab
    Wait Until Element Is Visible    ${FLIGHTSTAB}    10
    Click Element    ${FLIGHTSTAB}

Change From airport
    Log    This keyword will change the default text in the From field to the desired text passed to the Input Text sub keyword.
    Wait Until Element Is Visible    ${FROM}
    Clear Element Text    ${FROM}
    Input Text    ${FROM}    BUR

Change To airport
    Log    This keyword will change the default text in the To field to the desired text passed to the Input Text sub keyword.
    Wait Until Element is Visible    ${TO
    Clear Element Text    ${TO}
    Input Text    ${TO}    SMF

Change Departure Date
    Log    This keyword will change the Departure date on the Departing field.
    Wait Until Element Is Visible    ${DEPARTING}
    Click Button    ${DEPARTING}
    Wait Until Element Is Visible    ${DATEPICKER}
    Log    Friday the 13th 2018 is the day to be selected.
    Click Element    xpath=//div[@id='ui-datepicker-div']/descendant::a[contains(text(), '13')]
    Wait Until Element Is Not Visible    ${DATEPICKER}

Change Returning Date
    Log    This keyword will change the Return date on the Returning field.
    Wait Until Element Is Visible    ${RETURNING}
    Click Button    ${RETURNING}
    Wait Until Element Is Visible    ${DATEPICKER}
    Log    Clicking the previous button in since the default month is set to August.
    Click Element    xpath=//span[contains(text(), 'Prev')]/ancestor::a
    Log    Sunday the 15th 2018 is the day to be selected.
    Click Element    xpath=//div[@id='ui-datepicker-div']/descendant::a[contains(text(), '15')]
    Wait Until Element Is Not Visible    ${DATEPICKER}

Set Number of Travelers
    Log    This keyword will set the number of Travelers to 2
    Wait Until Element is Visible    ${TRAVELERS}
    Select From List    ${TRAVELERS}    2

Search Flights
    Sleep    5
    Wait Until Element Is Visible    ${SEARCHBUTTON}
    Click Button    ${SEARCHBUTTON}

Minimize main window
    Minimize Window

Switch to Exit Unit Window
    Log    This keyword will Switch windows
    #The main window is indexed as 0. The secondary window can be selected by passing 1 to Change window.
    Change Windows    1
    Capture Page Screenshot    clicktripz_flight_ad_window_1.png

Click Show me the first deal and maximize window
    Wait Until Element is Visible    ${SHOWMEBUTTON}
    Click Element    ${SHOWMEBUTTON}
    #Maximize Browser Window
    Sleep    2
    Capture Page Screenshot    clicktripz_flight_ad_window_2.png

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
    \    Capture Page Screenshot    clicktripz_flight_ad_tab_${tabs}.png

Capture URL of Exit Unit
    Exit Unit URL Capture

*** Keywords ***
Set up
    Open Browser and Go to URL    ${URL}

