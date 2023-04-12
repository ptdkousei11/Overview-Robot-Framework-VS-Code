*** Settings ***
Documentation       Exercise 10

Library             Collections


*** Variables ***
&{student1}     name=Lucy    age=20
&{student2}     name=Jamie    age=18


*** Test Cases ***
Printing out the names and the ages of the two students
    ${value}    Get Dictionary Values    ${student1}    False
    Log To Console    Student1
    Log To Console    ${value}

    ${value}    Get Dictionary Values    ${student2}    False
    Log To Console    Student2
    Log To Console    ${value}

Add another key-value as id-1111 to hash student1
    Set To Dictionary    ${student1}    id=1111
    Log To Console    ${student1}
