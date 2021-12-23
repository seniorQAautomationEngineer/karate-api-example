@parallel=true
@regression

Feature: Get posts

  Background: Define URL
    * url apiUrl


  Scenario Outline: Negative tests. Get posts by id.
    Given path "/posts/<userId>"
    And method Get
    Then status 404
    And match response == {}


     # 1. Not valid user id
     # 2. Letter in user id
     # 3. Spec characters in user id
     # 4. Emoji in user id
     # 5. Other language in user id


    Examples:
      | userId |
      | 0      |
      | h      |
      | #$%&(  |
      | 🎅     |
      | рлвор  |


  Scenario Outline: Get posts and comments by id
    Given path "/posts/<userId>/comments"
    And method Get
    Then status 200
    And match response == []

     # 1. Not valid user id
     # 2. Letter in user id
     # 3. Spec characters in user id
     # 4. Emoji in user id
     # 5. Other language in user id


    Examples:
      | userId |
      | 0      |
      | h      |
      | #$%&(  |
      | 🎅     |
      | рлвор  |













