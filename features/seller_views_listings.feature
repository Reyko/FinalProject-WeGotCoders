Feature: Seller listings
  Background: 
    Given a seller exists
    And the seller has listings
    And the seller has logged in
    And the seller is on his profile page

  Scenario: A seller views a list of all his listings in his profile page
    Then the seller should see them in his profile page