Feature: Answering questions
  In order to understand the exercises
  As a student
  I want to be able to answer questions and get feedback on the result

  @javascript
  Scenario: Answering a question
    Given I have an account
    And that I am logged in
    And there exist a course
    And the course has 1 section
    And the section has 1 exercise
    And the exercise has questions
    And I am admitted to the course
    And I am on the exercise page
    And I click the "Questions" tab
    When I choose the incorrect answer
    Then the answer should be incorrect
    When I choose the correct answer
    Then the answer should be correct
    When I reload the page
    And I click the "Questions" tab
    Then the answer should be correct
