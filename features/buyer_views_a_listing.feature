Feature: Display a listing
  Background:
    Given seller exists
    And a listing exists
    And a buyer exists
    And the buyer signs in
  @wip
  Scenario: A buyer views a specific listing
    When the buyer clicks on the view listings link
    And he is on the listings index page
    And the buyer clicks on a specific listing
    Then the buyer should be on the show listing page
    And the buyer should see the specific listing details
