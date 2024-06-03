*** Settings ***
Resource    base.robot


*** Keywords ***
Quando verificar os produtos cadastrados
    ${RESPOSTA}    Get in            /produtos
    Set Global Variable              ${RESPOSTA}
    Log                              ${RESPOSTA.json()}

Quando verificar o id do produto
    [Arguments]                      ${id}
    ${RESPOSTA}       Get Id In      /produtos                     ${id}
    Set Test Variable                ${RESPOSTA}
    Log                              ${RESPOSTA.json()}

E o body não pode está vazio
    Should Not Be Empty              ${RESPOSTA.json()}

E validar os campos de retorno do body
    Set Test Variable                ${campos}                      ${RESPOSTA.json()}
    Dictionary Should Contain Key    ${campos}                      descricao
    Dictionary Should Contain Key    ${campos}                      nome
    Dictionary Should Contain Key    ${campos}                      preco
    Dictionary Should Contain Key    ${campos}                      quantidade
    Dictionary Should Contain Key    ${campos}                      _id
    Should Be Equal As Strings       blovmswv                       ${RESPOSTA.json()}[nome]
    Should Be Equal As Strings       1313                           ${RESPOSTA.json()}[preco]
    Should Be Equal As Strings       Test                           ${RESPOSTA.json()}[descricao]
    Should Be Equal As Strings       100                            ${RESPOSTA.json()}[quantidade]
    Log                              ${campos}

Então ira visuazilar o Status Code
    [Arguments]    ${statusCode}
    Should Be Equal As Strings       ${RESPOSTA.status_code}        ${statusCode}

