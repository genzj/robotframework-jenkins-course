*** Settings ***
Resource          ../R01-lib-resource.robot

*** Keywords ***
Fill Form
    [Arguments]    ${name}    ${email}    ${comment}
    sl.Input Text    id=cname    ${name}
    sl.Input Text    id=cemail    ${email}
    sl.Input Text    id=ccomment    ${comment}
    sl.Click Button    xpath=//input[@class="submit"][1]
    Run Keyword And Ignore Error    sl.Handle Alert    timeout=1

Should Message Be
    [Arguments]    ${name msg}    ${email msg}    ${comment msg}
    Run Keyword If    len('${name msg}') > 0    sl.Element Text Should Be    id=cname-error    ${name msg}
    ...    ELSE    sl.Element Should Not Be Visible    id=cname-error
    Run Keyword If    len('${email msg}') > 0    sl.Element Text Should Be    id=cemail-error    ${email msg}
    ...    ELSE    sl.Element Should Not Be Visible    id=cemail-error
    Run Keyword If    len('${comment msg}') > 0    sl.Element Text Should Be    id=ccomment-error    ${comment msg}
    ...    ELSE    sl.Element Should Not Be Visible    id=ccomment-error

Test Form Validation
    [Arguments]    ${name}    ${name msg}    ${email}    ${email msg}    ${comment}    ${comment msg}
    sl.Open Browser    https://jqueryvalidation.org/files/demo/    browser=chrome
    Fill Form    ${name}    ${email}    ${comment}
    Should Message Be    ${name msg}    ${email msg}    ${comment msg}
    [Teardown]    sl.Close All Browsers
