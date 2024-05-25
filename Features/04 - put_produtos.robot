*** Settings ***
Documentation       Documentacao do POST da API: ServeRest

Resource            ../resources/services.robot
Resource            ../resources/delete_produtos.resource
Suite Setup         Token

*** Test Cases ***
Atualizar um produto com sucesso
    Fakers
    Dado que tenha uma massa configurada
    Quando enviar uma requisição Put       ${token}    ${FakeNome}${FakerValor}    1010    Teste Automation    ${FakerValor}
    Então ira visuazilar o Status Code     200
    E verificar a mensagem de validação    Registro alterado com sucesso
    Excluir produto por nome               ${nome}

Atualizar um produto sem o Token
     Fakers
    Dado que tenha uma massa configurada
    Quando enviar uma requisição Put       ${EMPTY}    ${FakeNome}${FakerValor}    1010    Teste Automation    ${FakerValor}
    Então ira visuazilar o Status Code     401
    E verificar a mensagem de validação    Token de acesso ausente, inválido, expirado ou usuário do token não existe mais

Atualizar um produto com Token Invalido
     Fakers
    Dado que tenha uma massa configurada
    Quando enviar uma requisição Put       token_invalido    ${FakeNome}${FakerValor}    1010    Teste Automation    ${FakerValor}
    Então ira visuazilar o Status Code     401
    E verificar a mensagem de validação    Token de acesso ausente, inválido, expirado ou usuário do token não existe mais