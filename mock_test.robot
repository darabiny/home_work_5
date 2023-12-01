*** Settings ***
Library  main.py

Test Template    Testing

*** Test Cases ***    elem1            elem2               expect
Test_reverse_1        53.198627        50.113987           ['Россия', 'Самара', 'Садовая улица']


*** Keywords ***
Testing
    [Arguments]    ${elem1}    ${elem2}    ${expect}
    ${character}=    rek    ${elem1}    ${elem2}
    Should Be Equal    ['${character[0]}', '${character[1]}', '${character[2]}']    ${expect}