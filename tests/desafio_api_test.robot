*** Settings ***
Resource   ../resources/transferenciaInterna_resources.robot
Resource   ../resources/consultaSaldo_resources.robot
Resource   ../resources/consultaExtrato_resources.robot
Resource   ../resources/gerarToken.robot


*** Variables ***

*** Test Cases ***
#pre-condicao
    #Gerar Token
Cenário 01: Realizar tranferencia interna 
    Consultar Extrato

#Cenário 02: Fazer uma consulta no saldo 
   #Consultar Saldo

#Cenário 03: Fazer consulta de Extrato 
    #Consultar Extrato