Feature: Administrating questions
  As a teacher
  In order to examine students
  I want to be able to administrate questions

  @javascript
  Scenario: Creating a question
    Given I am logged in as a teacher
    And I am on the page for one of my exercises
    And I click "Edit this exercise's questions"
    And I click "Add question"
    And I fill in the question body
    And I add one correct alternative to the question
    And I add one incorrect alternative to the question
    And I click the button "Save"
    Then I should see a successful flash saying "Question successfully added"
