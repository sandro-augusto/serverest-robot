*** Settings ***
Documentation       Documentacao da API: ServeRest

Resource            ../resources/services.robot
Suite Setup         Conectar a API    /login

*** Test Cases ***
Fazer um Get Produtos com sucesso
    Quando verificar os produtos cadastrados
    Então ira visuazilar o Status Code        200
    # Então ira validar Status Code          _GET     200
    E o body não pode está vazio

Fazer um Get Id Produtos
    Quando verificar o id do produto
    Então ira visuazilar o Status Code        200
    # Então ira validar Status Code          _GETID    200
    E verificar o campo nome no retorno    Peter
    E o body não pode está vazio