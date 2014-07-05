Feature: New parking space for sale
  Background: 
    Given a seller exists
    And locations exist
    And the seller has logged in
    And the seller is on his profile page
  @wip
  Scenario: A Seller creates a new listing of a parking space for sale
    When the seller fills the details in the new listing form
    And the seller clicks the add new listing button
    Then a new listing should be created
    And the listing should belong to the seller