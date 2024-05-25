*** Settings ***
Resource    base.robot


*** Keywords ***
    
Quando enviar uma requisição Post
    [Arguments]    ${token}    ${cnome}    ${cpreco}     ${cdescricao}     ${cquantidade}
    ${bodyPostProd}        Factory New Produtos    cnome=${cnome}    cpreco=${cpreco}     cdescricao=${cdescricao}     cquantidade=${cquantidade}
    Log    ${bodyPostProd}
    HeadersAuth                        ${token}
    ${RESPOSTA}                        Post Cadastrar       /produtos        ${headersAuth}    ${bodyPostProd}
    Set Test Variable                  ${RESPOSTA}
    Log                                ${RESPOSTA.json()}

Então ira validar Status Code
    [Arguments]     ${metodo}         ${statusCode}
    Should Be Equal As Strings        ${RESPOSTA${metodo}.status_code}        ${statusCode}

E verificar a mensagem de validação
    [Arguments]     ${mensagem}
    Should Be Equal As Strings        ${RESPOSTA.json()}[message]             ${mensagem}

E verificar a mensagem de validação do campo
    [Arguments]                       ${campo}                                ${mensagem}
    Should Be Equal As Strings        ${RESPOSTA.json()}[${campo}]            ${mensagem}
