*** Settings ***
Documentation       Exercise 7

Library             String
Library             Collections


*** Variables ***
@{number}
...             Total 5136
...             1-113-VOIPMGCTRUNKGROUP
...             1-1500-VOIPMGCTRUNKGROUP
...             1-5067-VOIPMGCTRUNKGROUP
...             1-VOIPMGSUBTRUNKGROUP
...             2-12-VOIPMGCTRUNKGROUP


*** Test Cases ***
Print arr
    Log To Console    ${number}

Print value of total
    ${str}    Convert arr to str    ${number}
    ${total}    Get Regexp Matches    ${str}    (?<=Total\\s)\\d+
    FOR    ${i}    IN    @{total}
        Log To Console    ${i}
    END

Add value of VOIPMGCTRUNKGROUP into a array and print out that array.
    ${str}    Convert arr to str    ${number}
    ${value}    Get Regexp Matches    ${str}    (?<=\\d-)\\d*(?=-\\D+)
    @{value_arr}    Create List
    FOR    ${i}    IN    @{value}
        Log To Console    ${i}
        Append To List    ${value_arr}    ${i}
    END
    Log To Console    ${value_arr}


*** Keywords ***
Convert arr to str
    [Documentation]    Convert array to string
    [Arguments]    ${arr}
    ${str}    Evaluate    " ".join(${arr})
    RETURN    ${str}
