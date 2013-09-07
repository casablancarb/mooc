Feature: Seeing progress
  As a student
  In order to get motivated
  I want to be able to see my current progress

  # Exercise page
  Scenario: Increasing progress on exercise page
    Given I am elegible to answer questions for an exercise
    And that I am logged in
    And I am on the section page
    And I take a note of my progress
    And I answer a question correctly
    And I am on the section page
    Then my progress should be higher

  Scenario: Decreasing progress on exercise page
    Given I am elegible to answer questions for an exercise
    And that I am logged in
    And I answer a question correctly
    And I am on the section page
    And I take a note of my progress
    And I answer a question incorrectly
    And I am on the section page
    Then my progress should be lower

  # Course page
  Scenario: Increasing progress on course page
    Given I am elegible to answer questions for an exercise
    And that I am logged in
    And I am on the course page
    And I take a note of my progress
    And I answer a question correctly
    And I am on the course page
    Then my progress should be higher

  Scenario: Decreasing progress on course page
    Given I am elegible to answer questions for an exercise
    And that I am logged in
    And I answer a question correctly
    And I am on the course page
    And I take a note of my progress
    And I answer a question incorrectly
    And I am on the course page
    Then my progress should be lower
