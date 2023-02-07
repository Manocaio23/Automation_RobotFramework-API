*** Settings ***
Library    RequestsLibrary
Library    String 
Library    FakerLibrary
Library    Collections
Library    OperatingSystem


*** Variables ***

${URL}        https://login.sandbox.stone.com.br/auth/realms/stone_account/protocol/openid-connect
${TOKEN_}
*** Keywords ***

Gerar Token
  ${headers}    Create Dictionary    accenpt=application/json   
     Create Session    Stone       ${URL}    verify=true 


  ${body}    Create Dictionary    
    ...    client_id=admin-cli 
    ...    username=desafioqastone@gmail.com  
    ...    password=desafioqa   
    ...    grant_type=password
       

    #pq criei uma sessao
    ${resposta}    POST On Session
    ...    alias=Stone
    ...    url=/token
    ...    data=${body}
    ...    headers=${headers}
    ...    allow_redirects=true
    ...    expected_status=any

    
    log  ${resposta.json()}

    Set Test Variable      ${RESPOSTA}
    Set Suite Variable     ${RESPOSTA}    


    ${status_code}=     convert to String     ${resposta.status_code}
    Should Be Equal    ${status_code}     200
     
    ${body_}     convert to String     ${resposta.content}
    Should Contain     ${body_}     access_token

    #pegar e colocar em uma variavel 
     ${payload}=    Set Variable    ${resposta.json()}
     ${TOKEN_}=      Set Variable    ${payload['access_token']}
    
    
       

   
