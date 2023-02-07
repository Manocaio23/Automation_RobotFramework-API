*** Settings ***
Library    RequestsLibrary
Library    String 
Library    FakerLibrary
Library    Collections
Library    OperatingSystem


*** Variables ***
${TOKEN}  "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJUUUY0c2p5RUJfRUthV0VfSkxEZExHMVlKYXVnNklTV0tQbEdEeG9qNzhjIn0.eyJleHAiOjE2NzU2MTM1ODEsImlhdCI6MTY3NTYxMDg4MSwianRpIjoiNmE1YzVmOGUtYzhiZi00NWM4LTg5M2QtYzBhNmM5YTMzNWFiIiwiaXNzIjoiaHR0cHM6Ly9sb2dpbi5zYW5kYm94LnN0b25lLmNvbS5ici9hdXRoL3JlYWxtcy9zdG9uZV9hY2NvdW50Iiwic3ViIjoiZDliZDkzNmUtNzBkNi00OThmLTg2YzktOTA4N2VkZjY5OGNjIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiYWRtaW4tY2xpIiwic2Vzc2lvbl9zdGF0ZSI6ImY1ZTNkY2JiLWRmODAtNDU0My1hYThlLTc2MTQ1N2IwNTgxMyIsImFjciI6IjEiLCJzY29wZSI6ImV4cGVuZDp0cmFuc2ZlcnM6ZXh0ZXJuYWwgZW50aXR5OmxlZ2FsX3dyaXRlIHBpeDplbnRyeV9jbGFpbSBwaXg6cGF5bWVudF9pbnZvaWNlIGVudGl0eTp3cml0ZSBleHBlbmQ6Ym9sZXRvaXNzdWFuY2UgZXhwZW5kOnBheW1lbnRzIGVudGl0eTpyZWFkIHByaW5jaXBhbDpjb25zZW50IGVtYWlsIHBpeDplbnRyeSBzdG9uZV9hY2NvdW50cyBwcm9maWxlIGV4cGVuZDpyZWFkIGV4cGVuZDp0cmFuc2ZlcnM6aW50ZXJuYWwgcGl4OnBheW1lbnQgc3RvbmVfc3ViamVjdF9pZCBwYXltZW50YWNjb3VudDoqIiwic2lkIjoiZjVlM2RjYmItZGY4MC00NTQzLWFhOGUtNzYxNDU3YjA1ODEzIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInN0b25lX3N1YmplY3RfaWQiOiJ1c2VyOjYzMjRhNGM4LTZhZTYtNDJmMi1hYmQxLWExZWEyOWIwY2QxNSIsIm5hbWUiOiJEZXNhZmlvIFFBIERlc2FmaW8gUUEiLCJzdG9uZV9hY2NvdW50cyI6ImVuYWJsZWQiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJkZXNhZmlvcWFzdG9uZUBnbWFpbC5jb20iLCJnaXZlbl9uYW1lIjoiRGVzYWZpbyBRQSIsImxvY2FsZSI6InB0LUJSIiwiZmFtaWx5X25hbWUiOiJEZXNhZmlvIFFBIiwiZW1haWwiOiJkZXNhZmlvcWFzdG9uZUBnbWFpbC5jb20ifQ.buTPMwgsZlXWGV2E185jtvZu4REBVG4pXfP0Z-gh7hjT9BCS6BTjvAYF8YlvsjQdj8WY4gedskTiNYQxU48x6VblLtwrYWa9EeqcgiWP61m2OsONdhXB4YqFgrZYYYo2jjw2Pf7PHxjz6VpXxuzZxwIty1hdinVm7-UaGllnaX3ygpi2iOveYTQtPQUvw4SkI6MICLhoDggQJ_Ff4VDCuZB5ZumvY4UmLsljiZQmq7XOHbm1WFiHwC9yT2tabZZox-vvPKOQPePm3ojhmjGm1cvzf_4AoyUBCDb2krzE5zwUmUzXeVF-VDdDWO_7hm9JllQBe0WYCB9E79Tb1F2RaA"
${ID}    bccd3bf7-3369-4622-b769-71f93d66da87
${BASE}    https://sandbox-api.openbank.stone.com.br
*** Keywords ***


Realizar transferencia interna
     [Arguments]    ${TOKEN_}
    ${body}    Create Dictionary    
    ...    amount= 100  
    ...    account_id=${ID}  
    ...    {
    ...     "amount": 100,
   ...     "account_id": "bccd3bf7-3369-4622-b769-71f93d66da87",
   ...     "target":{
   ...     "account":{
   ...         "account_code":"475384"
   ...     }
   ...     }
}

     
    #Log    ${body}
    # Criar sessao
    
    ${resposta}    POST On Session
    ...    alias=Stone
    ...    url=/api/v1/internal_transfers
    ...    get file=C:/api/body.text
    
    #log  ${resposta.json()}
    
#Criar sessao
#comum em todos os testes
  #  ${headers}    Create Dictionary    Authorization=${TOKEN}      accenpt=application/json     Content-Type=application/json    
  #  Create Session    alias=Stone    url=https://sandbox-api.openbank.stone.com.br      headers=${headers} 
   
 
Teste
     [Arguments]    ${TOKEN_}
    Create Session    Stone       ${BASE}    verify=true
    
    
     ${headers}    Create Dictionary    Authorization=Bearer ${TOKEN_}      accenpt=application/json     Content-Type=application/json 

      ${body} =      get file     C:/api/body.json
 
    
   
    ${response}=  POST On Session    
    ...    alias=Stone    
    ...    url=/api/v1/internal_transfers
    ...    data= ${body}   
    ...    headers=${headers}
    ...    allow_redirects=true
    ...    expected_status=any
    
    
    Log To Console      ${response.status_code}
    
