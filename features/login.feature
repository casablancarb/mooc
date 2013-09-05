Feature: Loggin in
  As a user with an account
  In order to use the system
  I want to be able to log in

  Scenario: Logging in with correct credentials
    Given I have a user account
    And I am on the home page
    And I click the menu item "Log in"
    And I enter my credentials
    And I click the button "Log in"
    Then I should see a successful flash saying "Successfully logged in"

  Scenario: Logging in with incorrect credentials
    Given I have a user account
    And I am on the home page
    And I click the menu item "Log in"
    And I enter incorrect credentials
    And I click the button "Log in"
    Then I should see an error flash saying "Email or password is invalid"
