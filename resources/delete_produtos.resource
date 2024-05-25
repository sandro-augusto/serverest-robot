*** Settings ***
Resource    base.robot


*** Keywords ***

Dado que tenha uma massa configurada
    Cadastro produtos com sucesso

Quando enviar uma requisição pra excluir um produto
    [Arguments]                                ${token}
    HeadersAuth                                ${token}
    ${RESPOSTA}      Delete in    /produtos    ${headersAuth}                ${id}
    Set Test Variable                          ${RESPOSTA}
    Log                                        ${RESPOSTA.json()}    

E verificar a mensagem de exclusão
    [Arguments]                                ${mensagem}
    Should Be Equal                            ${RESPOSTA.json()}[message]    ${mensagem}