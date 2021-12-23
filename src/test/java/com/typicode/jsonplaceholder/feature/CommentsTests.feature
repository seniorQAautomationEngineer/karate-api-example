@parallel=true
@regression

Feature: Comments tests

  Background: Define URL
    * url apiUrl
    * def postIdDefault = 1
    * def commentsResponse = read("classpath:com/typicode/jsonplaceholder/json/commentsResponse.json")


  Scenario Outline: Get all comments
    Given path "/comments"
    And method Get
    Then status 200
    And match response == '#array'
    And match response[0].postId == <postId>
    And match response[0].id == <id>
    And match response[0].name contains "<name>"
    And match response[0].email == "<email>"
    And match response[0].body contains "<body>"


    Examples:
      | postId | id | name   | email              | body       |
      | 1      | 1  | labore | Eliseo@gardner.biz | laudantium |


  Scenario Outline: Get posts and comments by id
    Given path "/posts/<postId>/comments"
    And method Get
    Then status 200
    And match response == commentsResponse

    Examples:
      | postId |
      | 1      |


  Scenario: Get posts and comments by post id
    Given param postId = postIdDefault
    Given path "/comments"
    And method Get
    Then status 200
    And match response == commentsResponse






