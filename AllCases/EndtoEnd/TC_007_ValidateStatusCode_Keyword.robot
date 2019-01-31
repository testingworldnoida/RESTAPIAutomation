*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../../Resources/UserKeyword.robot

*** Variables ***
${App_Base_URL}  http://thetestingworldapi.com/
${StudentID}  28


*** Test Cases ***
TC_001_Fetch_Student_details_by_id
    Fetch and Validate Get Status Code  50  200
    ${respnse}=  Fetch and Return Get Response  50
    log to console  ${respnse.content}
    ${respnse1}=  Fetch and Return Get Response  51
    log to console  ${respnse1.content}

