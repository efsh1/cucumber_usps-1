Feature: Find elements by xpath, read attributes

  Scenario: Find elements by xpath
    Given I navigate to home page
    Then I press calculate a price link
    Then I verify Zip Code Lookup URL
    Then I click on Post office locator link
