*** Settings ***
Documentation       Documentacao do POST da API: ServeRest

Resource            ../resources/services.robot
Resource            ../resources/delete_produtos.resource
Suite Setup         Token

*** Test Cases ***
Atualizar um produto com sucesso
    Fakers
    Dado que tenha uma massa configurada
    Quando enviar uma requisição Put       ${FakeNome}${FakerValor}    1010    Teste Automation    ${FakerValor}
    Então ira visuazilar o Status Code     200
    E verificar a mensagem de validação    Registro alterado com sucesso
    Excluir produto por nome               ${nome}