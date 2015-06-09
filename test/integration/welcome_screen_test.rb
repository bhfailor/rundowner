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

    cmd = 'rails s -e test -d'
    kill_process(cmd) # kill a preexisting rails server
    server_msg = %x( #{ cmd } )  # get fails unless server is running
    driver = Selenium::WebDriver.for :firefox
    driver.get 'http://localhost:3000'
    a = driver.switch_to.alert
    assert a.text, "welcome#index"
    a.dismiss
    driver.quit
    kill_process(cmd)
  end

  private

    def kill_process(cmd)
      pid = %x(ps ax | grep '#{ cmd }' | grep -v grep).scan(/^(\d+)\s/)
      %x(kill #{ pid[0][0] }) if pid && pid[0] && pid[0][0]
    end
end
