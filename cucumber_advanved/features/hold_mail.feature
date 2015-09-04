Feature: Testing Hold Mail page
  @hold_mail

  Scenario: Happy path for Hold Mail page
    Given I navigate to Hold Mail page
    And I type "Stefan" in the first name field
    And I type "Bee" in the Last Name field
    And I type "94132" in the zip code field

