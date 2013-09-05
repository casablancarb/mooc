Feature: Register
  As a person knowing a course code given by a teacher
  In order to participate in the course
  I want to be able to register

  Scenario: Register with a valid course code
    Given I am on the home page
    And I click the menu item "Register"
    And I enter a valid course code
    And I enter my personal information
    And I click the button "Register"
    Then I should see a successful flash saying "Successfully registered"
