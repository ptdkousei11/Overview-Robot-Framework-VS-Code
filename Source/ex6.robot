*** Settings ***
Documentation       Exercise 6

Library             Collections


*** Variables ***
&{em1}          Name=A    Year=10
&{em2}          Name=B    Year=15
&{employee}     &{em1}    &{em2}


*** Test Cases ***
Print info of em1, em2
    ${key}    Get Dictionary Keys    ${employee}
    Log To Console    ${key}

Print year of em2
    Log To Console    ${em2['Year']}
