Feature: Seeing progress
  As a student
  In order to get motivated
  I want to be able to see my current progress

  Scenario: Completed progress
    Given I am elegible to answer questions for an exercise
    And that I am logged in
    And that I have answered 3 of 3 questions correctly
    And I am on the course page
    Then my progress for that exercise should be "100%"

  Scenario: Partial progress
    Given I am elegible to answer questions for an exercise
    And that I am logged in
    And that I have answered 1 of 3 questions correctly
    And I am on the course page
    Then my progress for that exercise should be "33%"
