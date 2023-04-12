*** Settings ***
Documentation       Exercise 6

Library             Collections


*** Variables ***
&{em1}          Name=A    Year=10
&{em2}          Name=B    Year=15
&{employee}     em1=&{em1}    em2=&{em2}


*** Test Cases ***
Print info of em1, em2
    ${key}    Get Dictionary Keys    ${employee.em1}
    Log To Console    ${key}
    #Log To Console    ${employee}

Print year of em2
    Log To Console    ${employee.em2.Year}
