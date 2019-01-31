*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}=  http://thetestingworldapi.com/

*** Test Cases ***
TC_004 create new resource
    create session  AddData  ${base_url}
    &{body}=  create dictionary  first_name=Testing  middle_name=A  last_name=World  date_of_birth=12/12/1990
    &{header}=  create dictionary  Content-Type=application/json

    ${response}=  post request  AddData  /api/studentsDetails  data=${body}  headers=${header}
    log to console  ${response.content}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  201
