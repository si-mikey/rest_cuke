Feature: Verify various HTTP method calls return correct data and status code

  Scenario Outline: Verify Mocky.io service responses 
    Given I setup for the "Mocky" service
    When I make a "<http_call>" call on route "<http_route>" with parameters "<http_params>"
    Then the service returns the status code "<resp_status>"
    And the service returns the content-type "<resp_type>" 
    And the service returns the body "<resp_body>" 

    Examples: 
    | http_call | http_route   | http_params | resp_status | resp_type                         | resp_body                  |
    | GET       | /200         |  /          |  200        | 'application/json; charset=utf-8' | 'this is the 200 response' |
    | GET       | /400         |  /          |  404        | 'application/json; charset=utf-8' | 'this is the 400 response' |
    | GET       | /500         |  /          |  500        | 'application/json; charset=utf-8' | 'this is the 500 response' | 
