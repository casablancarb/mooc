Feature: Announcements
  As a user taking a course
  In order to stay updated on what's new
  I want to be able to see announcements

  Scenario: Reading an announcement
    Given there is an announcement
    And I have access to the announcement
    And that I am logged in
    And I am on the course page
    Then I should see the announcement
