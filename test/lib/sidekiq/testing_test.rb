require 'test_helper'
require 'sidekiq/testing'
require 'pry'

class SidekiqTestingTest < ActiveSupport::TestCase
  def teardown
    # this is default: https://github.com/mperham/sidekiq/wiki/Testing
    Sidekiq::Testing.fake!
  end
    
  class SettingDifferentModes < SidekiqTestingTest
    test 'default' do
      assert Sidekiq::Testing.fake? # should be default
      assert Sidekiq::Testing.enabled? # true unless disabled
    end
    test 'fake' do
      Sidekiq::Testing.inline!
      refute Sidekiq::Testing.fake?
      Sidekiq::Testing.fake!
      assert Sidekiq::Testing.fake?
    end
    test 'inline' do
      Sidekiq::Testing.inline!
      assert Sidekiq::Testing.inline?
    end
    test 'disabled' do
      Sidekiq::Testing.disable!
      assert Sidekiq::Testing.disabled?
      refute Sidekiq::Testing.enabled?
    end
  end
  
end
