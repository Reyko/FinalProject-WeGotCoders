Feature: New user sign up
  Scenario: A user signs up either as buyer or seller
    Given that the user is on the registration page
    When the user enters his details
    And the user selects a type of account
    And the user clicks the submit button
    Then a new account should be created