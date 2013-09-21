Feature: Joining a course
  As a student
  In order to work with the exercises
  I want to be able to join a course

  Scenario: Joining a course with a valid admission code
    Given I have an account
    And that I am logged in
    And there exist a course
    And I am on the home page
    And I click the menu item "Course Catalog"
    And I click "Join course"
    And I enter a valid admission code
    And I click the button "Request join"
    Then I should see a successful flash saying "Successfully joined course"
    And the page heading should be the name of the course

  Scenario: Listing courses I'm admitted to
    Given I have an account
    And that I am logged in
    And I am admitted to a course
    And I am on the home page
    Then I should see the course title in the list of my courses
