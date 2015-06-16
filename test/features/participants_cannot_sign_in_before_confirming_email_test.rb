require 'test_helper'
require 'minitest/metadata'

class ParticipantsCannotSignInBeforeConfirmingEmailTest <
    Capybara::Rails::TestCase
  require 'pry'

  let (:p) {
    Participant.new(password: 'top_sekret', email: 'three.foo@bar.com')
  }

  background do
    p.save!
  end
  
  scenario 'email confirmed' do
    message_body = ActionMailer::Base.deliveries.last.body.raw_source
    visit message_body.scan(/localhost:3000(.*)\">/)[0][0]
    assert_text 'Your email address has been successfully confirmed.'
    assert current_path, '/participants/sign_in'
    fill_in 'participant_email', with: p.email
    fill_in 'participant_password', with: p.password
    find('#new_participant > div.actions > input[type="submit"]').click
    refute_text 'Invalid email or password.'
    refute_text 'confirm your email address'
    assert current_path == '/'
    assert :success
  end

  scenario 'email incorrect' do
    visit '/participants/sign_in'
    fill_in 'participant_email', with: "bogus_"+p.email
    fill_in 'participant_password', with: p.password
    find('#new_participant > div.actions > input[type="submit"]').click
    assert_text 'Invalid email or password.'
    refute_text 'confirm your email address'
    assert current_path == '/participants/sign_in'
    assert :success
  end

  scenario 'email not confirmed' do
    visit '/participants/sign_in'
    fill_in 'participant_email', with: p.email
    fill_in 'participant_password', with: p.password
    find('#new_participant > div.actions > input[type="submit"]').click
    refute_text 'Invalid email or password.'
    assert_text 'confirm your email address'
    assert current_path == '/participants/sign_in'
    assert :success
  end
end
