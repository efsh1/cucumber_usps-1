@calculate_price
Feature: Test calculate a price

  Scenario: Calculate mailing price
    Given I navigate to calculate price page
    Then I type "94002" to From ZIP Code field
    Then I type "94040" to To ZIP Code field
    Then I enter mailing date
    Then I select shape as Letter
    Then I enter Weight as "1" Pounds
    And I click on Continue button
    Then I press on check-box Display All Option
    Then I press on radio-button Priority Mail Express 1-day
    And I should be able see Print Postage button as "Print Postage"

  Scenario: Checking price is visible
    Given I navigate to calculate price page
    Then I type "94002" to From ZIP Code field
    Then I type "94040" to To ZIP Code field
    Then I enter mailing date
    Then I select shape as Package
    Then I enter package Weight as "12" Pounds
    And I click on Continue button
    Then I should be able see the price in Priority Mail Express window

  Scenario: International mail
    Given I navigate to home page
    Then I successfully login with valid credentials
    Then I press calculate a price link
    Then I select destination country
    Then I Enter Item Value as $ "200"
    Then I select Flat Rate Boxes
    Then I should be able see the price in Priority Mail Express International window
    And I should be able see Print Postage button as "Print Postage"







