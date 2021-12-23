@parallel=true
@regression

Feature: End-to-edn tests

  Background: Define URL
    * url apiUrl
    * def dataFile = read(dataSource + ".users.yaml")
    * def commentsResponse = read("classpath:com/typicode/jsonplaceholder/json/commentsResponse.json")






  Scenario: End-to-end tests.CRUD operations.
    * def userId = 1
    Given path "/posts"
    And method Post
    Then status 201
    * def newPostId = response.id
    Given param postId = newPostId
    Given path "/comments"
    And method Get
    Then status 200
    Given path "/posts/" + userId
    And method Put
    Then status 200
    Given path "/posts/" + userId
    And method Delete
    Then status 200















