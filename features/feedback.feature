Feature: Leaving Feedback
  As a user with an account
  In order to tell the teacher what I think
  I want to be able to leave feedback

  Background:
    Given I have an account
    And that I am logged in
    And there exist a course
    And I am admitted to the course
    And the course has 1 section
    And the section has 1 exercise

  Scenario: Leaving feedback for an exercise
    Given I am on the exercise page
    And I click the "Feedback" tab
    And I fill in the feedback form
    When I click the button "Submit feedback"
    Then I should see a successful flash saying "Thank you for your feedback!"

  Scenario: Leaving feedback without writing anything
    Given I am on the exercise page
    And I click the "Feedback" tab
    When I click the button "Submit feedback"
    Then I should see an error flash saying "Could not submit feedback"
