
class HoldMailPage < PageActions

  def path
    "https://holdmail.usps.com/holdmail/"
  end

  def hold_first_field
    @browser.find_element(:id, "firstName")
  end

  def hold_last_name_field
    @browser.find_element(:id, "lastName")
  end

  def hold_zip
    @browser.find_element(:id, "zip")
  end
end