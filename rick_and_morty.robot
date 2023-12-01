*** Settings ***
Library  main.py

*** Test Cases ***
Count
    ${character}=  kol
    Should Be Equal    ${character}    ${826}

