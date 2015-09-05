@login
Feature: Login functionality

#  please use these two steps if you need login in your other scenarios
  Scenario: Login with valid credentials (using nested step)
    Given I navigate to home page
    Given I successfully login with valid credentials

  Scenario: Login with  empty password field
    Given I navigate to home page
    Then I click on login buttton
    And I type "Vsgdhsjdh" as a login
    Then I click on Singin button
    And I should see a password is required as "A password is required."

  Scenario: Login with invalid (too short) password
    Given I navigate to home page
    Then I click on login buttton
    And I type "Vitaligfhg" as a login
    And I type "12" as a passsword
    Then I click on Singin button
    And I should see error password to short as "Your Password must be at least 10 characters long."

  Scenario: Login with invalid password
    Given I navigate to home page
    Then I click on login buttton
    And I type "Vitalifggf" as a login
    And I type "1234567" as a passsword
    Then I click on Singin button
    And I should see error password incorrect as "We do not recognize your username and/or password. Please try again."

  Scenario: Login with  empty username field
    Given I navigate to home page
    Then I click on login buttton
    And I type "1234567" as a passsword
    Then I click on Singin button
    And I should see a username is required as "A Username is a required entry."

  Scenario: Login with  too short username
    Given I navigate to home page
    Then I click on login buttton
    And I type "123" as a login
    And I type "1234567" as a passsword
    Then I click on Singin button
    And I should see too short username as "Your Username must be at least 6 characters long."

  Scenario: Login with invalid username
    Given I navigate to home page
    Then I click on login buttton
    And I type "1234567" as a login
    And I type "123456789" as a passsword
    Then I click on Singin button
    And I should see error password incorrect as "We do not recognize your username and/or password. Please try again."


