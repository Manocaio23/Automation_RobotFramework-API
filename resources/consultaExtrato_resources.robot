*** Settings ***
Library    RequestsLibrary
Library    String 
Library    FakerLibrary
Library    Collections
Library    OperatingSystem

Resource   ../resources/gerarToken.robot


*** Variables ***
${TOKEN}     "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJUUUY0c2p5RUJfRUthV0VfSkxEZExHMVlKYXVnNklTV0tQbEdEeG9qNzhjIn0.eyJleHAiOjE2NzU3MzMxNTIsImlhdCI6MTY3NTczMDQ1MiwianRpIjoiZjMyNDE5NmItZDJhMS00YmViLWFkY2QtNjU1MWE2NjlkNjQzIiwiaXNzIjoiaHR0cHM6Ly9sb2dpbi5zYW5kYm94LnN0b25lLmNvbS5ici9hdXRoL3JlYWxtcy9zdG9uZV9hY2NvdW50Iiwic3ViIjoiZDliZDkzNmUtNzBkNi00OThmLTg2YzktOTA4N2VkZjY5OGNjIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiYWRtaW4tY2xpIiwic2Vzc2lvbl9zdGF0ZSI6ImRjNjE2Y2U3LWJmZTQtNDg0Yi04NTMzLWVlNWEyYWFjNDIxZiIsImFjciI6IjEiLCJzY29wZSI6ImV4cGVuZDp0cmFuc2ZlcnM6ZXh0ZXJuYWwgZW50aXR5OmxlZ2FsX3dyaXRlIHBpeDplbnRyeV9jbGFpbSBwaXg6cGF5bWVudF9pbnZvaWNlIGVudGl0eTp3cml0ZSBleHBlbmQ6Ym9sZXRvaXNzdWFuY2UgZXhwZW5kOnBheW1lbnRzIGVudGl0eTpyZWFkIHByaW5jaXBhbDpjb25zZW50IGVtYWlsIHBpeDplbnRyeSBzdG9uZV9hY2NvdW50cyBwcm9maWxlIGV4cGVuZDpyZWFkIGV4cGVuZDp0cmFuc2ZlcnM6aW50ZXJuYWwgcGl4OnBheW1lbnQgc3RvbmVfc3ViamVjdF9pZCBwYXltZW50YWNjb3VudDoqIiwic2lkIjoiZGM2MTZjZTctYmZlNC00ODRiLTg1MzMtZWU1YTJhYWM0MjFmIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInN0b25lX3N1YmplY3RfaWQiOiJ1c2VyOjYzMjRhNGM4LTZhZTYtNDJmMi1hYmQxLWExZWEyOWIwY2QxNSIsIm5hbWUiOiJEZXNhZmlvIFFBIERlc2FmaW8gUUEiLCJzdG9uZV9hY2NvdW50cyI6ImVuYWJsZWQiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJkZXNhZmlvcWFzdG9uZUBnbWFpbC5jb20iLCJnaXZlbl9uYW1lIjoiRGVzYWZpbyBRQSIsImxvY2FsZSI6InB0LUJSIiwiZmFtaWx5X25hbWUiOiJEZXNhZmlvIFFBIiwiZW1haWwiOiJkZXNhZmlvcWFzdG9uZUBnbWFpbC5jb20ifQ.WKodfUWxrpLIoR2msgL17RdHOuptvAIl4hiI0vYr4rgWyiD8eGlusO-l54e-YXEbF4XpeKUOcSXxfelmDhqrGC1kI9ThPNKc5xgHgpAwaN9F_9jnXR9rG7I1vrhmshA8AjH7w2s9DaTytOVQKyqoHEfJ68-yw0IMrTlDszPrfy7M3lKLFT0UJvhLtY5UZHeqLO7jDeKXQhqaM9l9GgC6Yk5cFdsp8UWLuPCJpsmTa8LjzkfJNasO7TTQm9rGWo1yyw5sdHelippCwutW-gcDmohwX7-80wftTXCX-1EgbSU-Xh98m3DeGpHZQVWYHp46zxGI3PANYdB8pPZyWJo_JA"
${ID}    bccd3bf7-3369-4622-b769-71f93d66da87
${BASE}    https://sandbox-api.openbank.stone.com.br
*** Keywords ***

Consultar Extrato
     
     ${headers}    Create Dictionary   Content-Type=application/json   Authorization="Bearer "+${TOKEN} 
    Create Session    alias=Stone     url=${BASE}    verify=True    headers=${headers}    disable_warnings=True    
       ${saldo}=      Get On Session   alias=Stone     url=/api/v1/accounts/${ID}/statement
     Set Test Variable    ${resp_consulta}    ${saldo.json()}
     log    ${resp_consulta}

Consultar Extrato outra forma 
    Create Session    stone    ${BASE}
     ${headers}    Create Dictionary   Content-Type=application/json   Authorization=${TOKEN} 
     ${saldo}=  Get request    Stone     /api/v1/accounts/${ID}/statement    headers=${headers}
    Log to Console     ${saldo.status_code}

