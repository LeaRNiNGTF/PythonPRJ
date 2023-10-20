*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://172.17.0.2:8000

*** Test Cases ***
Health Check Test
    [Documentation]    Test the health status of the server
    When I send a GET request to the endpoint    ${BASE_URL}/health
    Then the status code should be    200
    And the response should contain    Server is running

Invalid Endpoint Test
    [Documentation]    Test an invalid endpoint
    When I send a GET request to an invalid endpoint    ${BASE_URL}/invalid
    Then the status code should be    404
    And the response should contain    Not Found

Data Retrieval Test
    [Documentation]    Test the retrieval of data from the server
    When I send a GET request to the endpoint    ${BASE_URL}/data
    Then the status code should be    200
    And the response should contain    Expected Data

Data Update Test
    [Documentation]    Test updating data on the server
    Given the payload    {"key": "value"}
    When I send a POST request to the endpoint    ${BASE_URL}/update    with the payload
    Then the status code should be    200
    And the response should contain    Update Successful
