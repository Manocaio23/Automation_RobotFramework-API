*** Settings ***
Library    RequestsLibrary
Library    String 
Library    FakerLibrary

*** Variables ***
${EMAIL}    caio18augusto@outlook.com

*** Keywords ***

Criar novo usuario     #GERANDO EMAIL ALEATORIO
    #${palavra_aleatoria}    Generate Random String    length=3   chars=[LETTERS]
    #${palavra_aleatoria}    Convert To Lower Case        ${palavra_aleatoria} 
    # Log    Minha palavra aleatoria     ${palavra_aleatoria}@outlook.com
    #Set Test Variable       ${EMAIL}        ${palavra_aleatoria}@outlook.com 
     
     ${EMAIL}              
     Log    ${EMAIL}    
     
     
Cadastrar o usuario criado na serverRest
    ${EMAIL}  FakerLibrary.Email            
    Log    ${EMAIL}  
    ${body}    Create Dictionary    
    ...    nome=Mano Caioo   
    ...    email=${EMAIL}  
    ...    password=1234    
    ...    administrador=true
       

    Log    ${body}
    
    Criar sessao da ServerRest
    #pq criei uma sessao
    ${resposta}    POST On Session
    ...    alias=ServeRest
    ...    url=/usuarios
    ...   json=${body}
   
    log  ${resposta.json()}
    
Criar sessao da ServerRest
#comum em todos os testes
    ${headers}    Create Dictionary    accenpt=application/json    Content-Type=application/json 
    Create Session    alias=ServeRest    url=https://serverest.dev      headers=${headers} 
   
     
