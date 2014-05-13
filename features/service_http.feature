Feature: Verify various HTTP method calls return correct data and status code

  Scenario Outline: Verify service responses 
    Given I setup the "mocky.io" service
    When I make a "<http_call>" call
    Then the service returns the status "<resp_status>"
    And the service returns the content-type "<resp_type>" 
    And the service returns the body "<resp_body>" 

    Examples: 
    | http_call | resp_status | resp_type                         | resp_body                  |
    | GET       | 200         | "application/json; charset=utf-8" | "This is the 200 response" |
