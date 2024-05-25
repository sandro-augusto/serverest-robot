*** Settings ***
Documentation       Documentacao da API: ServeRest
Resource            ./base.robot



*** Variables ***
${token}
${base_url}         https://serverest.dev
&{headersLogin}     accept=application/json
...                 Content-Type=application/json
&{bodyLOGIN}        email=sandroteste@qa.com
...                 password=testeQA


*** Keywords ***
# # SETUP E TEARDOWN
Conectar a API
    [Arguments]                       ${endpoint}
    Create Session    apiServeRest    ${base_url}    ${headersLogin}


# # Ações
Post in
    [Arguments]         ${endpoint}   ${body}
    ${response}         POST          ${base_url}${endpoint} 
    ...                 json=${body}    
    ...                 headers=${headersLogin}
    
    [Return]            ${response}


Post Cadastrar
    [Arguments]         ${endpoint}   ${headers}    ${body}
    ${response}         POST          ${base_url}${endpoint} 
    ...                 json=${body}   
    ...                 headers=${headers}
    ...                 expected_status=any
    
    [Return]            ${response}


Get in
    [Arguments]         ${endpoint}
    ${response}         GET            ${base_url}${endpoint}   
    ...                 headers=${headersLogin}
    
    [Return]            ${response}

Get Id In
    [Arguments]         ${endpoint}    ${id}
    ${response}         GET            ${base_url}${endpoint}/${id}
    ...                 headers=${headersLogin}
    
    [Return]            ${response}

Put in
    [Arguments]         ${endpoint}      ${headers}      ${body}    ${id}
    ${response}         PUT              ${base_url}${endpoint}/${id}
    ...                 json=${body}
    ...                 headers=${headers}
    
    [Return]            ${response}

Delete in
    [Arguments]         ${endpoint}      ${headers}      ${id}
    ${response}         DELETE            ${base_url}${endpoint}/${id}
    ...                 headers=${headers}
    
    [Return]            ${response}

Token
    Conectar a API    /login
    Quando entrar com usuario e senha

Cadastro produtos com sucesso
    Fakers
    Quando enviar uma requisição Post    ${FakeNome}${FakerValor}    1010    Teste Automation    1049
    Set Test Variable       ${id}                ${RESPOSTA.json()}[_id]

HeadersAuth
    ${headersAuth}       Create Dictionary    Authorization=${token}
    Set Test Variable    ${headersAuth}

Excluir Produto
    [Arguments]
    Set Test Variable   ${id}                ${RESPOSTA.json()}[_id]
    Quando enviar uma requisição pra excluir um produto

Excluir produto por nome
    [Arguments]          ${parametros}
    ${getResposta}       Get in         /produtos/?nome=${parametros}
    ${id}                Convert To String    ${getResposta.json()}[produtos][0][_id]
    Set Test Variable    ${id}
    ${RESPOSTA_DEL}      Delete in    /produtos    ${headersAuth}    ${id}

Cadastro duplicado
    [Arguments]          ${cnome}    ${cpreco}     ${cdescricao}     ${cquantidade}
    ${bodyPostProd}      Factory New Produtos    cnome=${cnome}    cpreco=${cpreco}     cdescricao=${cdescricao}     cquantidade=${cquantidade}
    Log    ${bodyPostProd}
    HeadersAuth
    Post Cadastrar       /produtos        ${headersAuth}    ${bodyPostProd}
    ${RESPOSTA}          Post Cadastrar       /produtos        ${headersAuth}    ${bodyPostProd}
    Set Test Variable    ${RESPOSTA}
    Log                  ${RESPOSTA.json()}
