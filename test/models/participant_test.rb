require "test_helper"

class ParticipantTest < ActiveSupport::TestCase
  def participant
    @participant ||= Participant.new
  end

  def test_valid
    participant.email = 'three.foo@bar.com' # not used in fixtures
    participant.password = 'top_sekret' # at least 8 characters
    assert participant.valid?
  end
end
