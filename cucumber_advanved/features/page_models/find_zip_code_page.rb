class FindZipCodePage < PageActions

  def path
    "https://tools.usps.com/go/ZipLookupAction_input"
  end

  def address_text_field
    @browser.find_element(:id, "tAddress")
  end

  def city_text_field
    @browser.find_element(:id, "tCity")
  end

  def state_dropdown
    @browser.find_element(:css, "span.select-current-text")
  end

  def select_state state
    state_dropdown.click
    state_list = @browser.find_element(:css, "ul.select-ul").find_elements(:tag_name, "a")

    state_list.find {|element| element.text == state}.click
    # state_list.each do |element|
    #   if element.text == state
    #     element.click
    #    break
    #    end
    # end
  end

  def find_zip_code_button
    @browser.find_element(:id, "lookupZipFindBtn")
  end

  def table_result
    @browser.find_element(:id, "result-list").find_elements(:tag_name, "li")
  end

  def collect_zip_code
    zip_array = []
    table_result.each {|result| zip_array << result.find_element(:css, "span.zip").text}
  end

end
