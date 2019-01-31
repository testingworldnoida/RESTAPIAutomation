*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}  http://thetestingworldapi.com/
${original_first_name}   Hello
${update_first_name}   Testing

*** Test Cases ***
TC_006_End_to_End_TestCase
    create session  E2E   ${base_url}
    &{header}=  create dictionary  Content-Type=application/json
    &{body}=  create dictionary  first_name=${original_first_name}  middle_name=A  last_name=World  date_of_birth=12/12/1985
    ${post_response}=  post request  E2E   api/studentsDetails  headers=${header}  data=${body}
    ${json_response}=  to json  ${post_response.content}
    @{id_list}=  get value from json  ${json_response}  id
    log to console  ${id_list}
    ${id}=  get from list  ${id_list}  0

    &{body1}=  create dictionary  id=${id}  first_name=${update_first_name}  middle_name=A  last_name=World  date_of_birth=12/12/1985
    ${put_response}=  put request  E2E   api/studentsDetails/${id}  headers=${header}  data=${body1}
    log to console  ${put_response.content}
    log to console  ${put_response.status_code}

    Fetch Details and Validate  ${id}

    ${delete_response}=  delete request  E2E  api/studentsDetails/${id}
    ${json_delete}=  to json  ${delete_response.content}
    @{Message}=  get value from json  ${json_delete}  status
    ${statusM}=  get from list  ${Message}  0
    should be equal  ${statusM}  true


*** Keywords ***
Fetch Details and Validate
    [Arguments]  ${studentId}
    ${get_request}=   get request  E2E  api/studentsDetails/${studentId}
    ${json_response}=  to json  ${get_request.content}
    @{Lfirst_name}=  get value from json  ${json_response}  data.first_name
    ${first_name}=  get from list  ${Lfirst_name}  0
    should be equal  ${first_name}  ${update_first_name}
