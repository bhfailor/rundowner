require 'test_helper'
#require 'selenium-webdriver'

class WelcomeScreenTest < ActionDispatch::IntegrationTest
  test "visit home page" do
    get '/'
    assert_response :success
    assert_select 'body > h1', 'Welcome Participant'
  end
  test "visit homepage with firefox" do
    require "selenium-webdriver"
    require 'pry'

    driver = Selenium::WebDriver.for :firefox
    #   driver = Selenium::Webdriver.for :firefox
    #    driver.navigate.to 'http://wytheville.mylabsplus.com'

    driver.navigate.to 'http://localhost:3000'

    driver.quit
  end
  
end
