@parallel=true
@regression

Feature: Photos tests

  Background: Define URL
    * url apiUrl


  Scenario Outline: Get all photos
    Given path "/photos"
    And method Get
    Then status 200
    And match response == '#array'
    And match response[0].albumId == <albumId>
    And match response[0].id == <id>
    And match response[0].title != null
    And match response[0].url contains "<url>"
    And match response[0].thumbnailUrl contains "<url>"



    Examples:
      | albumId | id | title     | url                         |
      | 1       | 1  | accusamus | https://via.placeholder.com |








