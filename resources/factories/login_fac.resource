*** Settings ***
Resource       ../base.robot

*** Keywords ***
Factory Login
    [Arguments]    ${email}    ${password}
        ${login}=    Create Dictionary
        Run Keyword If    "${email}" != 'None'            Set To Dictionary    ${login}     email            ${email}
        Run Keyword If    "${password}" != "None"         Set To Dictionary    ${login}     password         ${password}
    [Return]    ${login}