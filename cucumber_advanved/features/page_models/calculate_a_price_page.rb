

class CalculatePrice < PageActions

  def path
    "http://postcalc.usps.com/"
  end

  def calculate_a_price
    @browser.find_element(:xpath, "//a [@href='http://postcalc.usps.com/']")
  end

  def zip_code_look_up_link
    #1 HW move 'zip_code_look_up_link' to own class page PriceCalculate
    #2 verify HREF is not empty
    @browser.find_element(id: "ctl00_ContentPlaceHolder1_HyperLink2")
  end

  def post_office_locator_link
    @browser.find_element(:xpath, "//a [@href='https://www.usps.com/locator/welcome.htm']")
  end

  def input_zip_code_from
    @browser.find_element(:id, "ctl00_ContentPlaceHolder1_TextBoxFromZipCode")
  end

  def input_zip_code_to
    @browser.find_element(:id, "ctl00_ContentPlaceHolder1_TextBoxToZipCode")
  end

  # def date_clear
  #   @browser.find_element(:id, "ctl00_ContentPlaceHolder1_TextBoxShippingDate").clear()
  # end

  def new_date
    @browser.find_element(:id, "ctl00_ContentPlaceHolder1_TextBoxShippingDate").clear()
    day_in_5_days = Chronic.parse('5 days from now').strftime('%m/%d/%Y')
    @browser.find_element(:id, "ctl00_ContentPlaceHolder1_TextBoxShippingDate").send_keys("#{day_in_5_days}")
  end

  def select_shape
    @browser.find_element(:id,"ctl00_ContentPlaceHolder1_RadioButtonEnvelope")
  end

  def enter_weight
    @browser.find_element(:id,"ctl00_ContentPlaceHolder1_TextBoxPounds")
  end

  def continue_button
    @browser.find_element(:id,"ctl00_ContentPlaceHolder1_ImageButtonContinue")
  end

  def display_all_option_check_box
    @browser.find_element(:id, "ctl00_ContentPlaceHolder1_CheckBoxDisplayAllOptions")
  end

  def priority_mail_express_one_day
    @browser.find_element(:id, "radiobutton_1_XP")
  end

  def print_postage_button
    btn = @browser.find_element(:id, "ctl00_ContentPlaceHolder1_Image1")
    wait_for_element_displayed(btn)
    btn
  end

  def select_shape_as_package
    @browser.find_element(:id, "ctl00_ContentPlaceHolder1_RadioButtonPackage")
  end

  def price_result
    prices = [ ]
    all_elements =  @browser.find_element(:id, "ctl00_ContentPlaceHolder1_Accordion1_Pane_0_content_TableAccordionContent").find_elements(:tag_name, 'td')
    all_elements.each{|e| prices << e.find_element(:tag_name, 'div').text}
    prices.find_all{|price| price.include? "$"}
  end

  def country_dropdown
    @browser.find_element(:id, "ctl00_ContentPlaceHolder1_DropDownListCountry")
  end

  def select_country
    country_dropdown.click
    country_list = @browser.find_elements(:tag_name, "option")


    country_list.detect {|element| element.text == "Albania"}


    # country_list.each do |element|
    #   if element.text == country
    #     element.click
    #    break
    #    end
    # end

  end

  def price_result_intr
    prices = [ ]
    all_elements =  @browser.find_element(:id, "ctl00_ContentPlaceHolder1_TableNonAccordionContent").find_elements(:tag_name, 'td')
    all_elements.each{|e| prices << e.find_element(:tag_name, 'div').text}
    prices.find_all{|price| price.include? "$"}
  end

  def value_of_package
    field = @browser.find_element(:id, "ctl00_ContentPlaceHolder1_TextBoxContentValue")
    wait_for_element_displayed(field)
    field
  end

  def select_rate_box
    @browser.find_element(:id, "ctl00_ContentPlaceHolder1_RepeaterCarousel_ctl01_ImageCarousel")
  end

end
