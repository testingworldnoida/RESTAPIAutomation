*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  ../ReadContent/ReadJsonContent.py

*** Variables ***
${base_url}=  http://thetestingworldapi.com/


*** Keywords ***
Fetch and Validate Get Status Code
    [Arguments]  ${studentId}  ${expetcedStausCode}
    [Documentation]  This keyword is for validating status code of given student
    create session  SName   ${base_url}
    ${response}=  get request  SName   api/studentsDetails/${studentId}
    ${statusC}=  convert to string  ${response.status_code}
    should be equal  ${expetcedStausCode}  ${statusC}


Fetch and Return Get Response
    [Arguments]  ${studentId}
    create session  SName   ${base_url}
    ${response}=  get request  SName   api/studentsDetails/${studentId}
    [Return]  ${response}

Fetch Request Content
    ${jsonbody}=  read_request_content
    [Return]  ${jsonbody}

Welcome User
    [Documentation]  Executing New Test Case
    log to console  This is Starting of TestCase

End TestCase
    [Documentation]  TestCase Completed
    log to console  This is End of TestCase