*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../../Resources/UserKeyword.robot
*** Variables ***
${base_url}=  http://thetestingworldapi.com/

*** Test Cases ***
TC_004 create new resource
    create session  AddData  ${base_url}
    &{header}=  create dictionary  Content-Type=application/json
    ${jsonContent}=  Fetch Request Content
    ${response}=  post request  AddData  /api/studentsDetails  data=${jsonContent}  headers=${header}
    log to console  ${response.content}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  201
    log to console  ${response.content}
