*** Settings ***
Documentation       Documentacao da API: ServeRest

Resource            ../resources/services.robot
Suite Setup         Conectar a API    /login


*** Test Cases ***
Login Sucesso
    Quando entrar com usuario e senha    sandroteste@qa.com    testeQA
    Então o Status Code deverá ser       200
    E verificar a mensagem               Login realizado com sucesso

Login Email Incorreto
    Quando entrar com usuario e senha    abcteste@teste.com     testeQA
    Então o Status Code deverá ser       401
    E verificar a mensagem               Email e/ou senha inválidos

Login Senha Incorreto
    Quando entrar com usuario e senha    sandroteste@qa.com     12345QA
    Então o Status Code deverá ser       401
    E verificar a mensagem               Email e/ou senha inválidos

Login Email e Senha Incorretos
    Quando entrar com usuario e senha    teste@qa.com     12345QA
    Então o Status Code deverá ser       401
    E verificar a mensagem               Email e/ou senha inválidos


