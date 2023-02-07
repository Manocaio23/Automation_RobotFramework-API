*** Settings ***
Resource   ../resources/transferenciaInterna_resources.robot
Resource   ../resources/consultaSaldo_resources.robot
Resource   ../resources/consultaExtrato_resources.robot
Resource   ../resources/gerarToken.robot


*** Variables ***

*** Test Cases ***
pre-condicao
   ${TOKEN_}  Gerar Token         
#Cenário 01: Realizar tranferencia interna 
    Consultar Extrato    ${TOKEN_}
    
#Cenário 02: Fazer uma consulta no saldo 
  Consultar Saldo outra forma     ${TOKEN_}

#Cenário 03: Fazer consulta de Extrato 
     Teste      ${TOKEN_}