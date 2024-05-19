*** Settings ***
Documentation       Documentacao do POST da API: ServeRest

Resource            ../resources/services.robot
Suite Setup         Token

*** Test Cases ***
Cadastrar Produto com sucesso
    Fakers
    Quando enviar uma requisição Post      ${FakeNome}${FakerValor}    1010    Teste Automation    1049
    Então ira visuazilar o Status Code     201
    E verificar a mensagem de validação    Cadastro realizado com sucesso
    Excluir Produto
    E verificar a mensagem de exclusão     Registro excluído com sucesso

Validar Produto duplicado
    Fakers
    Cadastro duplicado                     Testes Robot 10    1010    Teste Automation    1049
    Então ira visuazilar o Status Code     400
    E verificar a mensagem de validação    Já existe produto com esse nome
    Excluir produto por nome               Testes Robot 10

Validar o campo Nome em Branco
    Quando enviar uma requisição Post      ${EMPTY}    1010    Teste Automation    1049
    Então ira visuazilar o Status Code     400
    E verificar a mensagem de validação do campo    nome    nome não pode ficar em branco

Validar o campo Nome Obrigatório
    Quando enviar uma requisição Post      None    1010    Teste Automation    1049
    Então ira visuazilar o Status Code     400
    E verificar a mensagem de validação do campo    nome    nome é obrigatório

Validar o campo Preço em Branco
    Quando enviar uma requisição Post      nome    ${EMPTY}    descricao    quantidade
    Então ira visuazilar o Status Code     400
    E verificar a mensagem de validação do campo    preco    preco deve ser um número

Validar o campo Preço Obrigatório
    Quando enviar uma requisição Post      nome    None    descricao    quantidade
    Então ira visuazilar o Status Code     400
    E verificar a mensagem de validação do campo    preco    preco é obrigatório

Validar o campo Descrição em Branco
    Quando enviar uma requisição Post      nome    preco    ${EMPTY}    quantidade
    Então ira visuazilar o Status Code     400
    E verificar a mensagem de validação do campo    descricao    descricao não pode ficar em branco

Validar o campo Descrição Obrigatório
    Quando enviar uma requisição Post      nome    preco    None    quantidade
    Então ira visuazilar o Status Code     400
    E verificar a mensagem de validação do campo    descricao    descricao é obrigatório

Validar o campo Quantidade em Branco
    Quando enviar uma requisição Post      nome    preco    descricao    ${EMPTY}
    Então ira visuazilar o Status Code     400
    E verificar a mensagem de validação do campo    quantidade    quantidade deve ser um número

Validar o campo Quantidade Obrigatório
    Quando enviar uma requisição Post      nome    preco    descricao    None
    Então ira visuazilar o Status Code     400
    E verificar a mensagem de validação do campo    quantidade    quantidade é obrigatório