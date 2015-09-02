Given(/^I navigate to USPS Look up Zip Code page$/) do
  create_browser
  usps.find_zip_code_page.visit

end

And(/^I type "([^"]*)" to street address field$/) do |address|
  usps.find_zip_code_page.address_text_field.send_keys address
end

Then(/^I type "([^"]*)" to city field$/) do |city|
  usps.find_zip_code_page.city_text_field.send_keys city
end

Then(/^I select "([^"]*)" from states drop down list$/) do |state|
  #expect(states_dropdown).to include state
  usps.find_zip_code_page.select_state state
end

And(/^I press Find Zip Code button$/) do
usps.find_zip_code_page.find_zip_code_button.click
end

Then(/^I see first result as "([^"]*)" Zip Code$/) do |arg|
 expect(usps.find_zip_code_page.table_result.size).to be > 0
  expect(usps.find_zip_code_page.collect_zip_code).not_to include nil
end
