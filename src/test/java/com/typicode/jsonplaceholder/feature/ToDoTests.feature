@parallel=true
@regression

Feature: To do tests

  Background: Define URL
    * url apiUrl
    * def dataFile = read(dataSource + ".users.yaml")


  Scenario Outline: Get to do by id
    Given path "/todos/<id>"
    And method Get
    Then status 200
    And match response ==
    """
 {
  "userId": <userId>,
  "id": <id>,
  "title": "<title>",
  "completed": <completed>
  }
    """



    Examples:
      | userId | id | title                              | completed |
      | 1      | 1  | delectus aut autem                 | false     |
      | 1      | 2  | quis ut nam facilis et officia qui | false     |
      | 1      | 3  | fugiat veniam minus                | false     |
      | 1      | 4  | et porro tempora                   | true      |


  Scenario Outline: Get all to do
    Given path "/todos"
    And method Get
    Then status 200
    And match response == '#array'
    And match response[0].userId == <userId>
    And match response[0].id == <id>
    And match response[0].title contains "<title>"
    And match response[0].completed == <completed>


    Examples:
      | userId | id | title    | completed |
      | 1      | 1  | delectus | false     |
