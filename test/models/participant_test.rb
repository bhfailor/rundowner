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
  
  test 'setting roles' do
    assert participant.trainer!
    assert participant.trainer?
    assert participant.client!
    assert participant.client?
    assert participant.dev!
    assert participant.dev?
  end

  test 'setting the default role' do
    assert participant.client?
  end
  
end
