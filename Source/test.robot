*** Settings ***
Documentation       testing something


*** Variables ***
&{USER 1}       name=Matti    address=xxx    phone=123
&{USER 2}       name=Teppo    address=yyy    phone=456
&{MANY}         first=1    second=${2}    ${3}=third
&{EVEN MORE}    &{MANY}    first=override    empty=
...             =empty    key\=here=value


*** Test Cases ***
TC02 - Dictionary
    &{dict} =    Create Dictionary    first=1    second=${2}    ${3}=third
    Length Should Be    ${dict}    3
    Log To Console    ${dict}[first]
    Log To Console    ${dict.first}
    Log To Console    ${EVEN MORE}
