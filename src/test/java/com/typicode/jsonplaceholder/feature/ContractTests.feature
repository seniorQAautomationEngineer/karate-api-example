@parallel=true
@regression

Feature: Contract tests

  Background: Define URL
    * url apiUrl
    * def dataFile = read(dataSource + ".users.yaml")
    * def userJsonSchema = read("classpath:com/typicode/jsonplaceholder/json/userJsonSchema.json")







  Scenario: Get all posts. Json schema.
    Given path "/posts"
    And method Get
    Then status 200
    And match response == '#array'
    And match response[0].userId == '#number'
    And match response[0].id == '#number'
    And match response[0].title == '#string'







  Scenario: Get posts by id. Json schema.
    * def userId = 1
    Given path "/posts/" + userId
    And method Get
    Then status 200
    And match response == userJsonSchema

















