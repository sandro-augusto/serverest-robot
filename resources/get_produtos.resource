*** Settings ***
Resource    base.robot


*** Keywords ***
Quando verificar os produtos cadastrados
    ${RESPOSTA}    Get in    /produtos
    Set Global Variable    ${RESPOSTA}
    Log    ${RESPOSTA.json()}

Quando verificar o id do produto
    Set Test Variable       ${id}       ${RESPOSTA.json()}[produtos][0][_id]
    Log                     ${id}
    ${RESPOSTA}       Get Id In    /produtos    ${id}
    ${nome}        Convert To String    ${RESPOSTA.json()}[nome]
    Set Test Variable       ${nome}
    Set Test Variable       ${RESPOSTA}
    Log                     ${RESPOSTA.json()}

E verificar o campo nome no retorno
    [Arguments]    ${mensagem}
    Should Be Equal As Strings    ${nome}      ${mensagem}

E o body não pode está vazio
    Should Not Be Empty    ${RESPOSTA.json()}

Então ira visuazilar o Status Code
    [Arguments]    ${statusCode}
    Should Be Equal As Strings        ${RESPOSTA.status_code}        ${statusCode}

