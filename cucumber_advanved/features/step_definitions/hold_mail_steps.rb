Given(/^I navigate to Hold Mail page$/) do
  create_browser
  usps.hold_mail_page.visit
end

And(/^I type "([^"]*)" in the first name field$/) do |f_name|
  usps.hold_mail_page.hold_first_field.send_keys f_name
end

And(/^I type "([^"]*)" in the Last Name field$/) do |l_name|
  usps.hold_mail_page.hold_last_name_field.send_keys l_name
end


And(/^I type "([^"]*)" in the zip code field$/) do |zip|
  usps.hold_mail_page.hold_zip.send_keys zip
  sleep 2
end