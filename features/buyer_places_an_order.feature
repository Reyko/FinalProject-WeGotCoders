Feature: Purchase a parking property
  Background:
    Given seller exists
    And a listing exists
    And a buyer exists
    And the buyer signs in
 
  Scenario: A buyer purchases a parking space
    When the buyer clicks on the view listings link
    And he is on the listings index page
    And the buyer clicks on a specific listing
    Then the buyer should be on the show listing page
    And the buyer should see the specific listing details

    When the buyer clicks on the Buy Now button
    And the buyer is on the new order page
    And the buyer fills his details
    And the buyer enter's his credit card details
    And the buyer clicks the complete order button
    Then a new order should be created
    And the buyer should be redirected to the homepage