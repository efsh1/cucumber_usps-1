class LoginPage < PageActions

  def login_field
    @browser.find_element(:id, "userName")
  end

  def password_field
    @browser.find_element(:id, "password")
  end

  def singin_button
    @browser.find_element(:id, "sign-in-button")
  end


  def password_required
    @browser.find_element(:id, "error-invalid-password")
  end

  def password_too_short
    @browser.find_element(:id, "error-min-password")
  end

  def password_username_incorrect
    sleep 3
    @browser.find_element(:css, 'div#actionerrors span.error')
  end

  def username_required
    @browser.find_element(:id, "error-invalid-username")
  end

  def username_too_short
    @browser.find_element(:id, "error-min-username")
  end

  def username_incorrect
    @browser.find_element(:id, "div#actionerrors span.error")
  end

end