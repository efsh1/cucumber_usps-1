# loaded first by cucumber
require 'selenium-webdriver'
require 'rspec'
require 'pry'
require 'chronic'
require_relative '../page_models/page_actions.rb'

# load all .rb files before...
Dir["../page_models/*.rb"].each {|file| require file}

DEFAULT_TIMEOUT = 30

SERVER_LABELS = {
    :production => "usps.com",
    :trunk => "trunk.usps.com",
    :integration => "integration.usps.com"
}


def get_browser
  (ENV['BROWSER'] || :firefox).to_sym
end



def get_environment
  #ENV ['SERVER'] will read system variable from your machine
  env = (ENV['SERVER'] || :production).to_sym
  #get key value from SERVER_LABEL hash
  SERVER_LABELS[env]

end



def create_browser
  @browser = Selenium::WebDriver.for get_browser
  @browser.manage.timeouts.implicit_wait = DEFAULT_TIMEOUT #for waiting an elements on the needed page
end

def usps
  @usps ||= USPS.new @browser
end

#