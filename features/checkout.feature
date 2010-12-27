Feature: Checking out after you complete your order
  As an online book buyer
  I need to provide my personal information
  so that the website can process my order  

  Background:
    Given I am on the depot site
  
  Scenario: Filling in all fields
    When I purchase a book
    And I complete the order with:
    | name      | address          | email           | pay_type    |
    | Sam Smith | 1213 Main Street | sam@example.com | Credit card |
    Then I should see "Thank you for your order"

  Scenario: Name is required
    When I purchase a book
    And I complete the order leaving the "Name" field blank
    Then I should see an error message with "Name can't be blank"

  Scenario: Address is required
    When I purchase a book
    And I complete the order leaving the "Address" field blank
    Then I should see an error message with "Address can't be blank"

  Scenario: Email is required
    When I purchase a book
    And I complete the order leaving the "Email" field blank
    Then I should see an error message with "Email can't be blank"

  Scenario: Options for Pay with
    When I purchase a book
    And go to the checkout page
    Then the Pay with dropdown should contain "Check"
    And the Pay with dropdown should contain "Credit card"
    And the Pay with dropdown should contain "Purchase order"
