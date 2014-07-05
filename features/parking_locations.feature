Feature: List parking locations
  Background: 
    Given a user exists
    And locations exist
    And the user signs in

  Scenario: A user views a list of parking locations
    When the user is on the parking locations page
    And he clicks on a location
    Then the user views the specific location