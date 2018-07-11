*** Settings ****
Documentation    This file is used to store common keywords and variables that can be utilized by any test cases that uses this file as a resource
Library           SeleniumLibrary    run_on_failure=Nothing

*** Variables ***
#${BROWSER}              %{BROWSER}
${BROWSER}              Chrome
${SHOWMEBUTTON}         xpath=//a[contains(text(), 'Show me the first deal!')]
${TABXPATH}             xpath=//li/descendant::a[@data-tab-advertiser-name]
${TABXPATHCOUNT}        //li/descendant::a[@data-tab-advertiser-name]
${LI}                   xpath=//li
${A}                    descendant::a[@data-tab-advertiser-name]

*** Keywords ***
Open Browser and Go to URL
    [Arguments]    ${URL}
    Open Browser    ${URL}    ${BROWSER}
    #Maximize Browser Window
    Set Selenium Speed    0

Minimize Window
    Log    Setting window size to 0 x 0 pixels. Minimize browser not supported in selenium webdriver. Only Maximize is supported.
    Set Window Size    0    0
    Set Window Position    1920    1080

Change Windows
    [Arguments]    ${number}
    ${window}=    get window titles
    Log     ${number}
    select window    @{window}[${number}]
    ${URL}    Get Location

Exit Unit URL Capture
    Run Keyword And Ignore Error    Change Windows    1
    ${ExitUnitURL}    Get Location
    Log    ${ExitUnitURL}
