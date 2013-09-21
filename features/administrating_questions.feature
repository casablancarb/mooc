Feature: Administrating questions
  As a teacher
  In order to examine students
  I want to be able to administrate questions

  Background:
    Given I am a teacher
    And that I am logged in
    And there exist a course
    And I am the teacher of the course
    And the course has 1 section
    And the section has 1 exercise

  @javascript
  Scenario: Creating a question
    Given I am on the admin exercise page
    When I click "Edit this exercise's questions"
    And I click "Add question"
    And I fill in the question body
    And I add one correct alternative to the question
    And I add one incorrect alternative to the question
    And I click the button "Save"
    Then I should see a successful flash saying "Question successfully added"
