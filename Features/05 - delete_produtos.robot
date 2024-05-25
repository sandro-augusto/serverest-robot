*** Settings ***
Documentation       Documentacao do POST da API: ServeRest

Resource            ../resources/services.robot
Resource            ../resources/delete_produtos.resource
Suite Setup         Token

*** Test Cases ***
Deletar produto com sucesso
    Dado que tenha uma massa configurada
    Quando enviar uma requisição pra excluir um produto    ${token}
    Então ira visuazilar o Status Code      200
    E verificar a mensagem de exclusão      Registro excluído com sucesso

Deletar produto sem o Token
    Dado que tenha uma massa configurada
    Quando enviar uma requisição pra excluir um produto    ${EMPTY}
    Então ira visuazilar o Status Code      401
    E verificar a mensagem de exclusão      Token de acesso ausente, inválido, expirado ou usuário do token não existe mais

Deletar produto com Token Invalido
    Dado que tenha uma massa configurada
    Quando enviar uma requisição pra excluir um produto    token_invalido
    Então ira visuazilar o Status Code      401
    E verificar a mensagem de exclusão      Token de acesso ausente, inválido, expirado ou usuário do token não existe mais

Validar se o Produto foi excluido com sucesso
    Cadastro produtos com sucesso
    Excluir Produto
    Quando enviar uma requisição pra excluir um produto      ${token}
    Então ira visuazilar o Status Code       200
    E verificar a mensagem de validação      Nenhum registro excluído