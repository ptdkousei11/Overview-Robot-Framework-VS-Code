*** Settings ***
Documentation       Exercise 11

Library             Collections


*** Variables ***
@{arr}
...             SGW_SIP_ID
...             CP_CALLM_ID
...             ID_CHANNEL_ID_SIP_DAL 20100
...             ID_CALLED_PARTY_NUM_1300000000
...             ID_CALLING_PARTY_CAT_CGPCAT_PAY_PHONE
&{Cat}          one=${arr}
&{pattern}      Cat=&{Cat}
&{msgIn}        pattern=&{pattern}    tcid=TC_01    start_boundary=ECCP_CC_SETUP


*** Test Cases ***
Print dict
    Log To Console    ${msgIn}

Print out "ID_CALLING_PARTY_CAT_CGPCAT_PAY_PHONE" in this hash
    Log To Console    ${msgIn.pattern.Cat.one[4]}

Delete key "-tcid" and then print out the hash.
    Remove From Dictionary    ${msgIn}    tcid
    Log To Console    ${msgIn}
