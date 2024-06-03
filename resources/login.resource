*** Settings ***
Resource    base.robot


*** Keywords ***

Quando entrar com usuario e senha
    [Arguments]                             ${email}       ${password}
    ${bodyLogin}        Factory Login       email=${email}    password=${password}
    Log      ${bodyLogin}
    ${RESPOSTA}         Post in    /login        ${bodyLogin}
    Log      ${RESPOSTA}
    Set Global Variable                          ${RESPOSTA}

Então o Status Code deverá ser
    [Arguments]                             ${statusCode}
    Should Be Equal As Strings              ${RESPOSTA.status_code}       ${statusCode}
    Log                                     ${RESPOSTA.status_code}

E verificar a mensagem
    [Arguments]                             ${mensagem}
    Should Be Equal                         ${RESPOSTA.json()}[message]    ${mensagem}
    Log                                     ${RESPOSTA.json()}[message]

