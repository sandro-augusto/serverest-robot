*** Settings ***
Resource    ../base.robot


*** Keywords ***
Factory New Produtos
    [Arguments]    ${cnome}    ${cpreco}    ${cdescricao}    ${cquantidade}
        ${produtos}=    Create Dictionary
        Run Keyword If    "${cnome}" != 'None'         Set To Dictionary    ${produtos}     nome          ${cnome}
        Run Keyword If    "${cpreco}" != "None"        Set To Dictionary    ${produtos}     preco         ${cpreco}
        Run Keyword If    "${cdescricao}" != "None"    Set To Dictionary    ${produtos}     descricao     ${cdescricao}
        Run Keyword If    "${cquantidade}" != "None"   Set To Dictionary    ${produtos}     quantidade    ${cquantidade}
    [Return]    ${produtos}