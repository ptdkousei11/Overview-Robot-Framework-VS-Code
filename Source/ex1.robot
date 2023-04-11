*** Settings ***
Documentation       Exercise 1

Library             RPA.Netsuite


*** Variables ***
@{list}     fruits    flower    vegetables    apple    banana
${a}        0


*** Test Cases ***
Print lenght
    ${lenght}    Get Length    ${list}
    Log To Console    ${lenght}

Print first
    Log To Console    ${list[0]}

Print last
    ${lenght}    Get Length    ${list}
    Log To Console    ${list[-1]}

Print all element of array
    Log To Console    ${list}

Verify if any element in array contains 'tables'
    FOR    ${i}    IN    @{list}
        IF    '${i}' == 'tables'
            Log To Console    Yes, there is at least one match!
            ${a}    Convert To Integer    1
        END
    END

    IF    ${a} == 0    Log To Console    No match
