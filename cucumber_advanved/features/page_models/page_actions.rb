class PageActions

  def initialize browser
    @browser = browser
  end

  def visit
    @browser.navigate.to build_url
  end

  def build_url
    #original location for path: HomePage class
    initial_url = self.path
    #initial_url == "http://www.usps.com"
    initial_url.gsub!("usps.com", get_environment)
  end


  def with_reduced_timeout(&block)
      @browser.manage.timeouts.implicit_wait = 1
      result = yield
      @browser.manage.timeouts.implicit_wait = DEFAULT_TIMEOUT
      result
  end

  def wait_for(timeout = 10, &block)
       @result=nil
       end_time = Time.now.to_i + timeout
       until Time.now.to_i > end_time
         begin
           @result = with_reduced_timeout{yield}
           return @result if @result
         rescue Selenium::WebDriver::Error::NoSuchElementError
           nil
         end
       end
       if @result == nil || @result == false
         raise "Timeout exceeded, block not succeeded"
       elsif @result == true
         return true
       end
  end


  def wait_for_text(timeout = 60, text)
        wait_for(timeout){@browser.page_source.include? text}
  end

  def wait_for_element_displayed(timeout = 60, element)
        wait_for(timeout){element.displayed?}
  end

end