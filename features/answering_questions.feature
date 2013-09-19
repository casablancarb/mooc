Feature: Answering questions
  In order to understand the exercises
  As a student
  I want to be able to answer questions and get feedback on the result

  @javascript
  Scenario: Answering a question
    Given a question with two answers
    And that I am logged in
    And that I have access to the course
    And that I am on the exercise page for that question
    And I click the "Questions" tab
    When I choose the incorrect answer
    Then the answer should be incorrect
    When I choose the correct answer
    Then the answer should be correct
    When I reload the page
    And I click the "Questions" tab
    Then the answer should be correct
