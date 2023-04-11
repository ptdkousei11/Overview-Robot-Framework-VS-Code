*** Settings ***
Documentation       Exercise 4

Library             String


*** Variables ***
${number}       0 1 22 333 4444 55555 666666 7777777


*** Test Cases ***
Print all number
    Log To Console    ${number}

Print 1 digit number
    ${1_digit}    Get Regexp Matches    ${number}    \\b\\d\\b
    FOR    ${i}    IN    @{1_digit}
        Log To Console    ${i}
    END

Print 2 digit number
    ${2_digit}    Get Regexp Matches    ${number}    \\b\\d\\d+\\b
    FOR    ${i}    IN    @{2_digit}
        Log To Console    ${i}
    END

Print with keywords
    Log To Console    Print 1 digit number
    Print 1 digit number    ${number}
    Log To Console    Print 2 digit number
    Print 2 digit number    ${number}


*** Keywords ***
Print 1 digit number
    [Documentation]    Return 1 digit number
    [Arguments]    ${string}
    ${digit}    Get Regexp Matches    ${string}    \\b\\d\\b
    FOR    ${i}    IN    @{digit}
        Log To Console    ${i}
    END
    RETURN    0

Print 2 digit number
    [Documentation]    Return 1 digit number
    [Arguments]    ${string}
    ${digit}    Get Regexp Matches    ${string}    \\b\\d\\d+\\b
    FOR    ${i}    IN    @{digit}
        Log To Console    ${i}
    END
    RETURN    0
