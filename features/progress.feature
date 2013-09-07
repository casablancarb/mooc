Feature: Seeing progress
  As a student
  In order to get motivated
  I want to be able to see my current progress

  Scenario: Completed progress
    Given I am elegible to answer questions for an exercise
    And that I am logged in
    And that I have answered 3 of 3 questions correctly
    And I am on the section page
    Then my progress for that exercise should be "100%"
    When I am on the course page
    Then my progress for that course should be "100%"

  Scenario: Partial progress
    Given I am elegible to answer questions for an exercise
    And that I am logged in
    And that I have answered 1 of 3 questions correctly
    And I am on the section page
    Then my progress for that exercise should be "33%"
    When I am on the course page
    Then my progress for that course should be "33%"

  Scenario: Partial section progress over multiple exercises
    Given I am elegible to answer questions for an exercise
    And that I am logged in
    And that I have answered 2 of 4 questions correctly
    And that there exist another exercise with 4 questions
    And I am on the section page
    Then my progress for that exercise should be "50%"
    When I am on the course page
    Then my progress for that course should be "25%"

  Scenario: Partial course progress over multiple sections and exercises
    Given I am elegible to answer questions for an exercise
    And that I am logged in
    And that I have answered 2 of 4 questions correctly
    And that there exist another exercise with 4 questions
    And that there exist another exercise with 4 questions
    When I am on the studies page
    Then my progress for that course should be "16%"
