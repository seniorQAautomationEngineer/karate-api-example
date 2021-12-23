@parallel=true
@regression

Feature: Users tests

  Background: Define URL
    * url apiUrl
    * def firstUserInResponse = read("classpath:com/typicode/jsonplaceholder/json/firstUser.json")


  Scenario: Get all users
    Given path "/users"
    And method Get
    Then status 200
    And match response == '#array'
    And match response contains firstUserInResponse








