require 'test_helper'
require 'minitest/metadata'

class CanAccessHomeTest < Capybara::Rails::TestCase

  test 'sanity' do
    visit root_path
    assert_content page, 'Welcome Participant'
    refute_content page, 'Goobye All!'
  end

  # want to repeat this a number of times
  def confirm_js_operation
    assert Capybara.current_driver, :selenium # default javascript driver
    visit root_path
    alert = page.driver.browser.switch_to.alert
    assert alert.text, 'welcome#index'
  end
  
  # the following should all be equivalent  
  it 'sees the alert popup', :js do
    confirm_js_operation
  end
  it 'sees the alert popup', :js => true do
    confirm_js_operation
  end
  scenario 'the alert popup is seen', :js do
    confirm_js_operation
  end
  
end
