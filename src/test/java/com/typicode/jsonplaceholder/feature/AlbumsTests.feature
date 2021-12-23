@parallel=true
@regression

Feature: Albums tests

  Background: Define URL
    * url apiUrl


  Scenario Outline: Get all albums
    Given path "/albums"
    And method Get
    Then status 200
    And match response == '#array'
    And match response[0].userId == <userId>
    And match response[0].id == <id>
    And match response[0].title contains "<title>"



    Examples:
      | userId | id | title  |
      | 1      | 1  | quidem |








