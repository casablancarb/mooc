Feature: Comments
  In order to enagage students
  As a student
  I want to be able to comment on exercises

  Scenario: As a student
    Given I am a student
    And that I am logged in
    And there exist a course
    And I am admitted to the course
    And the course has 1 section
    And the section has 1 exercise
    When I am on the exercise page
    And I click the "Comments" tab
    And I fill in the comment form
    And I click the button "Post comment"
    Then I should see a successful flash saying "Successfully posted comment"
    And I should see my comment
    And my comment should be a student comment
