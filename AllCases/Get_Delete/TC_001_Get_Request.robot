*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../../Resources/UserKeyword.robot
Documentation  This Suite is for Making GET Request and fetch student details
Suite Setup  Welcome User
Suite Teardown  End TestCase
Default Tags  Hello

*** Variables ***
${App_Base_URL}  http://thetestingworldapi.com/
${StudentID}  61


*** Test Cases ***
TC_001_Fetch_Student_details_by_id
    [Tags]  Smoke  Sanity
    create session  FetchData  ${App_Base_URL}
    ${Response}=  get request  FetchData  api/studentsDetails/${StudentID}
    ${actual_code}=  convert to string  ${Response.status_code}
    should be equal  ${actual_code}  200
    ${json_res}=  to json  ${Response.content}
    @{first_name_list}=    get value from json   ${json_res}  data.first_name
    ${first_name}=  get from list  ${first_name_list}  0
    log to console  ${first_name}
    should be equal  ${first_name}  abcdef
    @{last_name_list}=    get value from json   ${json_res}  data.last_name
    ${last_name}=  get from list  ${last_name_list}  0
    log to console  ${last_name}
    should be equal  ${last_name}  Automation



TC_002_Fetch_Student_details_by_Name
    create session  FetchData  ${App_Base_URL}
    ${Response}=  get request  FetchData  api/studentsDetails/${StudentID}
    ${actual_code}=  convert to string  ${Response.status_code}
    should be equal  ${actual_code}  200