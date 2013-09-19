Feature: Comments
  In order to enagage students
  As a student
  I want to be able to comment on exercises

  Scenario: As a student
    Given I am a student
    And I have access to an exercise
    And that I am logged in
    And I am on the exercise page
    And I click the "Comments" tab
    And I fill in the comment form
    And I click the button "Post comment"
    Then I should see a successful flash saying "Successfully posted comment"
    And I should see my comment
    And my comment should be a student comment
