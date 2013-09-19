Feature: Leaving Feedback
  As a user with an account
  In order to tell the teacher what I think
  I want to be able to leave feedback

  Scenario: Leaving feedback for an exercise
    Given I have access to an exercise
    And that I am logged in
    And I am on the exercise page
    And I click the "Feedback" tab
    And I fill in the feedback form
    And I click the button "Submit feedback"
    Then I should see a successful flash saying "Thank you for your feedback!"

  Scenario: Leaving feedback without writing anything
    Given I have access to an exercise
    And that I am logged in
    And I am on the exercise page
    And I click the "Feedback" tab
    And I click the button "Submit feedback"
    Then I should see an error flash saying "Could not submit feedback"
