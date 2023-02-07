*** Settings ***
Library    RequestsLibrary
Library    String 
Library    FakerLibrary
Library    Collections
Library    OperatingSystem


*** Variables ***
${TOKEN}  "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJUUUY0c2p5RUJfRUthV0VfSkxEZExHMVlKYXVnNklTV0tQbEdEeG9qNzhjIn0.eyJleHAiOjE2NzU2MTgwMTcsImlhdCI6MTY3NTYxNTMxNywianRpIjoiZDdhYjU5NjktOTBlOS00YTdkLWE1MzktMDQ2YTliODNiNjU5IiwiaXNzIjoiaHR0cHM6Ly9sb2dpbi5zYW5kYm94LnN0b25lLmNvbS5ici9hdXRoL3JlYWxtcy9zdG9uZV9hY2NvdW50Iiwic3ViIjoiZDliZDkzNmUtNzBkNi00OThmLTg2YzktOTA4N2VkZjY5OGNjIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiYWRtaW4tY2xpIiwic2Vzc2lvbl9zdGF0ZSI6IjNjZWU5NzhmLWYzZmEtNGMxNi1hMzJmLWEyZGYyYjQ2ODk0NyIsImFjciI6IjEiLCJzY29wZSI6ImV4cGVuZDp0cmFuc2ZlcnM6ZXh0ZXJuYWwgZW50aXR5OmxlZ2FsX3dyaXRlIHBpeDplbnRyeV9jbGFpbSBwaXg6cGF5bWVudF9pbnZvaWNlIGVudGl0eTp3cml0ZSBleHBlbmQ6Ym9sZXRvaXNzdWFuY2UgZXhwZW5kOnBheW1lbnRzIGVudGl0eTpyZWFkIHByaW5jaXBhbDpjb25zZW50IGVtYWlsIHBpeDplbnRyeSBzdG9uZV9hY2NvdW50cyBwcm9maWxlIGV4cGVuZDpyZWFkIGV4cGVuZDp0cmFuc2ZlcnM6aW50ZXJuYWwgcGl4OnBheW1lbnQgc3RvbmVfc3ViamVjdF9pZCBwYXltZW50YWNjb3VudDoqIiwic2lkIjoiM2NlZTk3OGYtZjNmYS00YzE2LWEzMmYtYTJkZjJiNDY4OTQ3IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInN0b25lX3N1YmplY3RfaWQiOiJ1c2VyOjYzMjRhNGM4LTZhZTYtNDJmMi1hYmQxLWExZWEyOWIwY2QxNSIsIm5hbWUiOiJEZXNhZmlvIFFBIERlc2FmaW8gUUEiLCJzdG9uZV9hY2NvdW50cyI6ImVuYWJsZWQiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJkZXNhZmlvcWFzdG9uZUBnbWFpbC5jb20iLCJnaXZlbl9uYW1lIjoiRGVzYWZpbyBRQSIsImxvY2FsZSI6InB0LUJSIiwiZmFtaWx5X25hbWUiOiJEZXNhZmlvIFFBIiwiZW1haWwiOiJkZXNhZmlvcWFzdG9uZUBnbWFpbC5jb20ifQ.hzYjFj1ipUjSByeJHSjviyUOXPn6zbdow_F1D0tukSQWkbr-IE2SgO7pCtBKYZBFlzPoefRJzVbZ5QmF76KR6Hi_OgI0nQ1ghGi56_GIMMm1CJXE4XW9Nl9icl2HLohPX5tIFkOOgnAUrZd5oeWo2U5Bi92ALwj-9bA-KKDqFzk59I-ivwUW2yCbFr98H86IMdNIS0lpgYqWZzmZ42jHCVFkMsHWmG5CuiuV0JdJuxnyRnopeEvMZp3n3N3FEDDbqYpaPdUsMMKT63JYCnK4MHrFejzkAIM0ObaZRqoejsHC4wzjW8BiVCqqM2kg2JstldQKPr_Tr-mMVYg1zach5g"
${ID}    bccd3bf7-3369-4622-b769-71f93d66da87
${BASE}    https://sandbox-api.openbank.stone.com.br
*** Keywords ***

Consultar Saldo
  Create Session    Stone     ${BASE}    verify=true
    ${headers}    Create Dictionary   Content-Type=application/json   Authorization=${TOKEN}
    ${saldo}=  Get On Session   alias=Stone     url=/api/v1/accounts/${ID}/balance 
    Set Test Variable    ${resp_consulta}    ${saldo.json()}
    log    ${resp_consulta}

Consultar Saldo outra forma 
    Create Session    stone    ${BASE}
     ${headers}    Create Dictionary   Content-Type=application/json   Authorization=${TOKEN}    
     ${saldo}=  Get request    Stone     /api/v1/accounts/${ID}/balance     headers=${headers}
    Log to Console     ${saldo.status_code}


