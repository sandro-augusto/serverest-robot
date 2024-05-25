*** Settings ***
Documentation       Documentacao da API: ServeRest

Resource            ../resources/services.robot
Suite Setup         Conectar a API    /login


*** Test Cases ***
# Fazer o Login e pegar o Token
Login
    Quando entrar com usuario e senha
    Então o Status Code deverá ser    200
    E verificar a mensagem            Login realizado com sucesso
