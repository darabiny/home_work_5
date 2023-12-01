*** Settings ***
Library  main.py

Test Template    Testing

*** Test Cases ***    elem1            elem2               expect
Test_reverse_1        53.198627        50.113987           ['Россия', 'Самара', 'Садовая улица']

Test_reverse_2        40.7127281       -74.0060152         ['United States', 'City of New York', 'Broadway']

Test_reverse_3        55.7505412        37.6174782         ['Россия', 'Москва', 'Соборная площадь']


*** Keywords ***
Testing
    [Arguments]    ${elem1}    ${elem2}    ${expect}
    ${character}=    reverse    ${elem1}    ${elem2}
    Should Be Equal    ['${character[0]}', '${character[1]}', '${character[2]}']    ${expect}