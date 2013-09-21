Feature: Announcements
  As a user taking a course
  In order to stay updated on what's new
  I want to be able to see announcements

  Scenario: Reading an announcement
    Given I have an account
    And that I am logged in
    And there exist a course
    And the course has an announcement
    And I am admitted to the course
    When I am on the course page
    Then I should see the announcement
