*** Settings ***
Library  main.py

Test Template    Testing

*** Test Cases ***    elem1        elem2                        elem3    expect
Test1                Самара        Красногвардейская улица      14       ['53.198627', '50.113987']

Test2                New York      Pearl Street                 211      ['40.7127281', '-74.0060152']

Test3                Москва        улица Большая Ордынка        40 с2    ['55.7505412', '37.6174782']


*** Keywords ***
Testing
    [Arguments]    ${elem1}    ${elem2}    ${elem3}    ${expect}
    ${character}=    search    ${elem1}    ${elem2}    ${elem3}
    Should Be Equal    ['${character[0]}', '${character[1]}']    ${expect}