*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}  http://thetestingworldapi.com


*** Test Cases ***
TC_003 Validate Delete Request
    [Tags]  Regression
    create session  AppAccess  ${base_url}
    ${response}=  delete request  AppAccess  /api/studentsDetails/77
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  200
    ${jsonresponse}=  to json  ${response.content}
    @{status_list}=  get value from json  ${jsonresponse}  status
    ${status}=  get from list  ${status_list}  0
    should be equal  ${status}  true


