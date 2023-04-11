*** Settings ***
Documentation       Exercise 2

Library             Collections
Library             RPA.Browser.Selenium
Library             RPA.FileSystem
Library             RPA.Netsuite


*** Variables ***
&{dict}     Name=Kousei    Age=23


*** Test Cases ***
Print all key of hash and then add them into an array
    @{arr}    Create List
    FOR    ${i}    IN    @{dict.keys()}
        Append To List    ${arr}    ${i}
    END
    Log To Console    ${arr}

Print key/value of hash
    Log To Console    Key of hash
    ${key}    Get Dictionary Keys    ${dict}
    FOR    ${i}    IN    @{key}
        Log To Console    ${i}
    END

    Log To Console    Value of hash
    ${value}    Get Dictionary Values    ${dict}
    FOR    ${i}    IN    @{value}
        Log To Console    ${i}
    END

Check if key is exist
    ${key}    Get Dictionary Keys    ${dict}
    ${a}    Convert To Integer    0
    FOR    ${i}    IN    @{key}
        IF    '${i}' == 'Name'
            Log To Console    Exist
            ${a}    Convert To Integer    1
        END
    END

    IF    ${a} == 0    Log To Console    Don't exist

Print size of hash
    ${lenght}    Get Length    ${dict}
    Log To Console    ${lenght}
