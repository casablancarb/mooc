Feature: Administrating announcements
  As a teacher
  In order to communicate with the students in a course
  I want to be able to post announcements to a course

  Background:
    Given I am a teacher
    And that I am logged in
    And there exist a course
    And I am the teacher of the course

  Scenario: Posting an announcement
    Given I am on the admin course page
    When I click "Post announcement!"
    And I fill in the announcement form
    And I click the button "Post"
    Then I should see a successful flash saying "Announcement successfully posted"

  Scenario: Posting an invalid announcement
    Given I am on the admin course page
    When I click "Post announcement!"
    And I click the button "Post"
    Then I should see an error flash saying "Could not create announcement"
    And I should see a list of form errors

