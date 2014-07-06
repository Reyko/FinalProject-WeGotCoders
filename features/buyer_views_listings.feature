Feature: Listings for sale
  Background: 
    Given a listing exist
    And a buyer exists
    And the buyer signs in
  @wip
  Scenario: A Buyer browses parking listings for sale
    When the buyer clicks on the view listings link
    And he is on the listings index page
    Then the page should have listings