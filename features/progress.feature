Feature: Seeing progress
  As a student
  In order to get motivated
  I want to be able to see my current progress

  Background:
    Given I have an account
    And that I am logged in
    And there exist a course
    And I am admitted to the course
    And the course has 1 section
    And the section has 1 exercise
    And the exercise has questions

  # Exercise page
  Scenario: Increasing progress on exercise page
    Given I am on the section page
    When I take a note of my progress
    And I answer a question correctly
    And I am on the section page
    Then my progress should be higher

  Scenario: Decreasing progress on exercise page
    Given I answer a question correctly
    And I am on the section page
    When I take a note of my progress
    And I answer a question incorrectly
    And I am on the section page
    Then my progress should be lower

  # Course page
  Scenario: Increasing progress on course page
    Given I am on the course page
    When I take a note of my progress
    And I answer a question correctly
    And I am on the course page
    Then my progress should be higher

  Scenario: Decreasing progress on course page
    Given I answer a question correctly
    And I am on the course page
    When I take a note of my progress
    And I answer a question incorrectly
    And I am on the course page
    Then my progress should be lower

  # Studies page
  Scenario: Increasing progress on studies page
    Given I am on the studies page
    When I take a note of my progress
    And I answer a question correctly
    And I am on the studies page
    Then my progress should be higher

  Scenario: Decreasing progress on studies page
    Given I answer a question correctly
    And I am on the studies page
    When I take a note of my progress
    And I answer a question incorrectly
    And I am on the studies page
    Then my progress should be lower
