Given(/^I navigate to calculate price page$/) do
  create_browser
  usps.calculate_a_price_page.visit
end

Then(/^I press calculate a price link$/) do
  usps.calculate_a_price_page.calculate_a_price.click
end

Then(/^I verify Zip Code Lookup URL$/) do
  usps.calculate_a_price_page.zip_code_look_up_link.attribute :href
end

Then(/^I click on Post office locator link$/) do
  usps.calculate_a_price_page.post_office_locator_link.click
end

Then(/^I type "([^"]*)" to From ZIP Code field$/) do |zip1|
  usps.calculate_a_price_page.input_zip_code_from.send_keys zip1
end

Then(/^I type "([^"]*)" to To ZIP Code field$/) do |zip2|
  usps.calculate_a_price_page.input_zip_code_to.send_keys zip2
end

Then(/^I enter mailing date$/) do
  usps.calculate_a_price_page.new_date
end

Then(/^I select shape as Letter$/) do
  usps.calculate_a_price_page.select_shape.click
end

Then(/^I enter Weight as "([^"]*)" Pounds/) do |weight|
  usps.calculate_a_price_page.enter_weight.send_keys weight
end

And(/^I click on Continue button$/) do
  usps.calculate_a_price_page.continue_button.click
end

Then(/^I press on check\-box Display All Option$/) do
  usps.calculate_a_price_page.display_all_option_check_box.click
end

Then(/^I press on radio\-button Priority Mail Express 1\-day$/) do
  usps.calculate_a_price_page.priority_mail_express_one_day.click
end

And(/^I should be able see Print Postage button as "([^"]*)"$/) do |arg|
  expect(usps.calculate_a_price_page.print_postage_button.attribute("alt")).to be == arg
end

Then(/^I select shape as Package$/) do
  usps.calculate_a_price_page.select_shape_as_package.click
end

Then(/^I enter package Weight as "([^"]*)" Pounds$/) do |weight|
  usps.calculate_a_price_page.enter_weight.send_keys weight
end

Then(/^I should be able see the price in Priority Mail Express window$/) do
  usps.calculate_a_price_page.price_result
end

Then(/^I select destination country$/) do
  usps.calculate_a_price_page.select_country.click
end

Then(/^I Enter Item Value as \$ "([^"]*)"$/) do |price|
  usps.calculate_a_price_page.value_of_package.send_keys price
end

Then(/^I select Flat Rate Boxes$/) do
  usps.calculate_a_price_page.select_rate_box.click
end

Then(/^I should be able see the price in Priority Mail Express International window$/) do
  usps.calculate_a_price_page.price_result_intr
end


