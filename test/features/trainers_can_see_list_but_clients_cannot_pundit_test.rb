require 'test_helper'
require 'minitest/metadata'

class TrainersCanSeeListButClientsCannotPunditTest <
    Capybara::Rails::TestCase
  require 'pry'

  let (:p_client) {
    Participant.new(password: 'top_sekret', email: 'c@bar.com', role: :client)
  }
  let (:p_trainer) {
    Participant.new(password: 'top_sekret', email: 't@bar.com', role: :trainer)
  }

  let (:login) { lambda do |p|
      p.save!
      message_body = ActionMailer::Base.deliveries.last.body.raw_source
      visit message_body.scan(/localhost:3000(.*)\">/)[0][0]
      assert_text 'Your email address has been successfully confirmed.'
      fill_in 'participant_email', with: p.email
      fill_in 'participant_password', with: p.password
      find('#new_participant > div.actions > input[type="submit"]').click
      refute_text 'Invalid email or password.'
      refute_text 'confirm your email address'
    end }
  
  background do
  end

  scenario 'client cannot see the list of participants' do
    login.call(p_client)
    visit '/participants'
    assert_text 'Access denied.'
  end

  scenario 'trainer can see the list of participants' do
    login.call(p_trainer)
    visit '/participants'
    refute_text 'Access denied.'
    assert_text p_trainer.email # p_trainer's email should be shown
  end
end
