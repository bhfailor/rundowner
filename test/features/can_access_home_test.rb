require 'test_helper'
require 'minitest/metadata' # I think spec DSL is needed for metadata

class CanAccessHomeTest < Capybara::Rails::TestCase
  include MiniTest::Metadata # I think spec DSL is needed for metadata
  test 'sanity' do
    visit root_path
    assert_content page, 'Welcome Participant'
    refute_content page, 'Goobye All!'
  end
  test 'seeing the alert popup' do
    Capybara.current_driver = :selenium # default javascript driver
    visit root_path
    alert = page.driver.browser.switch_to.alert
    assert alert.text, 'welcome#index'
    Capybara.current_driver = Capybara.default_driver
  end
  
end
