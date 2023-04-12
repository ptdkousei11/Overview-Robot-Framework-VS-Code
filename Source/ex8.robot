*** Settings ***
Documentation       Exercise 8

Library             String
Library             ex8.py
Library             Collections


*** Variables ***
@{arr}
...             <IPDR xsi:type="nortel:Nortel-SDP">
...             <nortel:recordID>2b08069da62b6406e3e58013a428379a60c322e9</nortel:recordID>
...             <nortel:sessionID>0</nortel:sessionID>
...             <nortel:sessionName>nortelnetworks</nortel:sessionName>
...             </IPDR>
...             <IPDR xsi:type="nortel:Nortel-SDP">
...             <nortel:recordID>3b08069da604b650f33e5801317a8598efc372694</nortel:recordID>
...             <nortel:sessionID>0</nortel:sessionID>
...             <nortel:sessionName>nortelnetworks</nortel:sessionName>
...             </IPDR>
...             <IPDR xsi:type="nortel:Nortel-Codec-List">
...             <nortel:recordID>2b08069da62b6406e3e58013a428379a60c322e9</nortel:recordID>
...             <nortel:sessionID>0</nortel:sessionID>
...             <nortel:mediaID>0</nortel:mediaID>
...             <nortel:codec>0 PCMU/8000</nortel:codec>
...             </IPDR>

${recordID}     2b08069da62b6406e3e58013a428379a60c322e9


*** Test Cases ***
Print packages that contain recordID
    ${new_str}    Convert arr to str    ${arr}
    @{new_arr}    Split Arr    ${new_str}
    ${packages}    Get Packages    ${new_arr}    ${recordID}
    Log To Console    ${packages}


*** Keywords ***
Convert arr to str
    [Documentation]    Convert array to string
    [Arguments]    ${arr}
    ${str}    Evaluate    ",".join(${arr})
    RETURN    ${str}
