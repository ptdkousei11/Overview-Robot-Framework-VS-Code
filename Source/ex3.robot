*** Settings ***
Documentation       Exercise 3

Library             RPA.Netsuite
Library             String
Resource            key.resource


*** Variables ***
${str}
...         A regular expression (abbreviated regexp or regex) is a way to describe sets of characters using syntactic rules. Many programming languages use or support regular expression. A REGULAR expression is then used by a special program or part of a programming language


*** Test Cases ***
Print string
    Log To Console    ${str}

Verify if string contains 'Perl'
    ${line}    Get Regexp Matches    ${str}    Perl
    ${length}    Get Length    ${line}
    IF    ${length} == 0
        Log To Console    No match!
    ELSE
        Log To Console    Yes, there is at least one match!
    END

Replace all 'regular/REGULAR expression' with 'PERL'
    ${new_str}    Replace String Using Regexp    ${str}    regular|REGULAR expression    PERL
    Log To Console    ${new_str}
