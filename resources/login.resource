*** Settings ***
Resource    base.robot


*** Keywords ***

Quando entrar com usuario e senha
    ${RESPOSTA}    Post in    /login        ${bodyLOGIN}
    ${token}       Convert To String        ${RESPOSTA.json()}[authorization]
    Set Global Variable                     ${token}
    Set Global Variable                     ${RESPOSTA}

Então o Status Code deverá ser
    [Arguments]                             ${statusCode}
    Should Be Equal As Strings              ${RESPOSTA.status_code}       ${statusCode}

E verificar a mensagem
    [Arguments]                             ${mensagem}
    Should Be Equal                         ${RESPOSTA.json()}[message]    ${mensagem}

