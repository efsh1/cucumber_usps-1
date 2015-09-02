Given(/^I navigate to home page$/) do
  create_browser
  usps.home_page.visit
end


Then(/^I click on login buttton$/) do
usps.home_page.login_button.click
end

Then(/^I type "([^"]*)" as a login$/) do |login|
  usps.login_page.login_field.send_keys login
end

Then(/^I type "([^"]*)" as a passsword$/) do |password|
  usps.login_page.password_field.send_keys password
end

Then(/^I click on Singin button$/) do
usps.login_page.singin_button.click
end

Then(/^I should be sing\-up as a user "([^"]*)"$/) do |name|
  expect(usps.home_page.login_button.text).to be == "Hi, #{name}"
end

# please use your own account for login
Given(/^I successfully login with valid credentials$/) do
  steps %{
    Then I click on login buttton
    And I type "Vitalii79" as a login
    And I type "Py8bh6B&G?" as a passsword
    Then I click on Singin button
  }
end

And(/^I should see a password is required as "([^"]*)"$/) do |password|
  expect(usps.login_page.password_required.text).to be == "#{password}"
end


And(/^I should see error password to short as "([^"]*)"$/) do |password|
  expect(usps.login_page.password_too_short.text).to be == "#{password}"
end


And(/^I should see error password incorrect as "([^"]*)"$/) do |password|
  expect(usps.login_page.password_username_incorrect.text).to be == "#{password}"
end

And(/^I should see a username is required as "([^"]*)"$/) do |username|
  expect(usps.login_page.username_required.text).to be == "#{username}"
end


And(/^I should see too short username as "([^"]*)"$/) do |username|
  expect(usps.login_page.username_too_short.text).to be == "#{username}"
end


