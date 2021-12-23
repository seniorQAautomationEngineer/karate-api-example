@parallel=true
@regression

Feature: Posts tests

  Background: Define URL
    * url apiUrl
    * def dataFile = read(dataSource + ".users.yaml")



  Scenario Outline: Get all posts.
    Given path "/posts"
    And method Get
    Then status 200
    And match response == '#array'
    And match response[0].userId == <userId>
    And match response[0].id == <id>
    And match response[0].title contains "<title>"
    And match response[0].body contains "<body>"


    Examples:
      | userId | id | title         | body         |
      | 1      | 1  | reprehenderit | consequuntur |


  Scenario Outline: Get posts by id
    Given path "/posts/<userId>"
    And method Get
    Then status 200
    And match response ==
    """
    {
  "userId": <userId>,
  "id": <userId>,
  "title": "#string",
  "body": "#string"
    }
    """


    Examples:
      | dataFile |
















