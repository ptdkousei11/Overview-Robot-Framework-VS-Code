*** Settings ***
Documentation       Exercise 9

Library             String
Library             Collections


*** Variables ***
${string}
...             I'm always happy and excited when newyear comes since this is the time when I come back my hometown. Seeing everyone in my family gets me feeling so good


*** Test Cases ***
Tranform this string into an array with its each element is each single word in the string
    @{characters}    Split String    ${string}
    Log To Console    ${characters}

Print out element
    @{characters}    Split String    ${string}
    ${2nd}    Get From List    ${characters}    1
    Log To Console    ${2nd}
    ${6th}    Get From List    ${characters}    5
    Log To Console    ${6th}
    ${20th}    Get From List    ${characters}    19
    Log To Console    ${20th}
