*** Settings ***
Resource    base.robot


*** Keywords ***

Quando enviar uma requisição Put
    Fakers
    [Arguments]    ${token}    ${cnome}    ${cpreco}     ${cdescricao}     ${cquantidade}
    ${bodyPostProd}        Factory New Produtos    cnome=${cnome}    cpreco=${cpreco}     cdescricao=${cdescricao}     cquantidade=${cquantidade}
    Log    ${bodyPostProd}
    HeadersAuth                ${token}
    ${nome}    Set Variable    ${bodyPostProd['nome']}
    ${RESPOSTA}   Put in    /produtos    ${headersAuth}       ${bodyPostProd}     ${id}
    Set Test Variable                    ${RESPOSTA}
    Set Test Variable                    ${nome}
    Log                                  ${RESPOSTA.json()}
