Feature: Main menu navigation
  As a student
  In order to not be able to change course data
  I should not be able to see the teacher menu

  Scenario: A student browsing
    Given I am a student
    And that I am logged in
    And I am on the home page
    Then I should not see the menu item "My teaching"

  Scenario: A teacher browsing
    Given I am a teacher
    And that I am logged in
    And I am on the home page
    Then I should see the menu item "My teaching"
