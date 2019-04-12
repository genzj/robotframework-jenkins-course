*** Settings ***
Library           Collections

*** Test Cases ***
01-list variable
    ${l}=    Create List    a    b    c
    Log    ${l}
    Log Many    ${l}
    Log Many    @{l}
    Collections.Log List    ${l}
    @{l2}=    Create List    a    b    c
    Should Be Equal    ${l}    ${l2}

02-dict variable
    ${d}=    Create Dictionary    k1=v1    k2=v2    ${1}=${2}
    Log    ${d.k1}
    ${val}=    Collections.Get From Dictionary    ${d}    ${1}
    Log    ${val}
    &{d2}=    Create Dictionary    k1=v1    k2=v2    ${1}=${2}
    Should Be Equal    ${d}    ${d2}
    Log Many    &{d}
    Collections.Log Dictionary    ${d}

03-evaluate
    ${random int} =    Evaluate    decimal.Decimal(random.randint(0, 5))    modules=random,decimal
    Log    ${random int}
