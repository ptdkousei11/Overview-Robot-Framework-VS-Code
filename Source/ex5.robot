*** Settings ***
Documentation       Exercise 5

Library             String
Library             RPA.Calendar
Library             Collections
Library             RPA.Netsuite
Library             ex5.py


*** Variables ***
@{arr}
...         <IPDR xsi:type="test">
...         <VoIP:uniqueCallId>005c-0100-2034-ffffffff@h10-250-191-194</VoIP:uniqueCallId>
...         <VoIP:callProgressState>5</VoIP:callProgressState>
...         <nortel:recordID>f37f9294a6157fb0073e58013bcaa52912532e5a9</nortel:recordID>
...         <nortel:recTime>2019-04-23T07:47:28.191Z</nortel:recTime>
...         <nortel:ansInd>true</nortel:ansInd>
...         </IPDR>


*** Test Cases ***
Print arr
    Log To Console    ${arr}

Convert arr to str with keywords
    ${str}    Convert arr to str    ${arr}
    Log To Console    ${str}

Count number of lines that contain 'VoIP' or 'Nortel'
    ${line}    Count Line Contain VoIP Or Nortel    ${arr}
    Log To Console    ${line}

Print out value of 'uniqueCallId'
    ${str}    Convert arr to str    ${arr}
    ${CallID}    Get Regexp Matches    ${str}    (?<=<VoIP:uniqueCallId>).*(?=</VoIP:uniqueCallId>)
    FOR    ${i}    IN    @{CallID}
        Log To Console    ${i}
    END

Print out value of 'recordID'
    ${str}    Convert arr to str    ${arr}
    ${recordID}    Get Regexp Matches    ${str}    (?<=<nortel:recordID>).*(?=</nortel:recordID>)
    FOR    ${i}    IN    @{recordID}
        Log To Console    ${i}
    END

Print out value of month in 'recTime' line
    ${str}    Convert arr to str    ${arr}
    ${recTime}    Get Regexp Matches    ${str}    (?<=\\d-)\\d\\d(?=-\\d)
    FOR    ${i}    IN    @{recTime}
        Log To Console    ${i}
    END


*** Keywords ***
Convert arr to str
    [Documentation]    Convert array to string
    [Arguments]    ${arr}
    ${str}    Evaluate    " ".join(${arr})
    RETURN    ${str}
