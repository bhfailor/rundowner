require "test_helper"

class ParticipantTest < ActiveSupport::TestCase
  def participant
    @participant ||=
      Participant.new(password: 'top_sekret', email: 'three.foo@bar.com')
  end

  test 'validation' do
    assert participant.valid?
  end

  test 'saving to db' do
    assert participant.save!
  end
    
end
