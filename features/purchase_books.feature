Feature: Purchase Books
  In order to read
  An online shopper will need to purchase books
  
  Background:
    Given I am on the shopping page
  
  Scenario: Verify cart with one book
    When I purchase "Pragmatic Project Automation"
    Then I should see "1" in the quantity for line "1"
    And I should see "Pragmatic Project Automation" in the description for line "1"
    And I should see "29.95" in the each for line "1"
    And I should see "29.95" in the total for line "1"
    And I should see "29.95" in the cart total

    
  Scenario: verify cart with two books
    When I purchase "Pragmatic Project Automation" 
    And I continue shopping
    And I purchase "Pragmatic Project Automation"
    Then I should see "2" in the quantity for line "1"
    And I should see "Pragmatic Project Automation" in the description for line "1"
    And I should see "29.95" in the each for line "1"
    And I should see "59.90" in the total for line "1"
    And I should see "59.90" in the cart total

  Scenario: verify cart with two different books
    When I purchase "Pragmatic Project Automation"
    And I continue shopping
    And I purchase "Pragmatic Version Control" 
    Then I should see "1" in the quantity for line "1"
    And I should see "Pragmatic Project Automation" in the description for line "1"
    And I should see "29.95" in the each for line "1"
    And I should see "29.95" in the total for line "1"
    And I should see "1" in the quantity for line "2"
    And I should see "Pragmatic Version Control" in the description for line "2"
    And I should see "28.50" in the each for line "2"
    And I should see "28.50" in the total for line "2"
    And I should see "58.45" in the cart total

  Scenario: Purchase two books
    When I purchase "Pragmatic Unit Testing (C#)"
    And I continue shopping
    And I purchase "Pragmatic Version Control"
    And I checkout
    And I enter "Cheezy" in the name field
    And I enter "123 Main Street" in the address field
    And I enter "cheezy@example.com" in the email field
    And I select "Credit card" from the pay type dropdown
    And I place my order
    Then I should see "Thank you for your order"

