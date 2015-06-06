require 'test_helper'

class WelcomeScreenTest < ActionDispatch::IntegrationTest
  test "visit home page" do
    get '/'
    assert_response :success
    assert_select 'body > h1', 'Welcome Participant'
  end
  
end
