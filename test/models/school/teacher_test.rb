require "test_helper"

class School::TeacherTest < ActiveSupport::TestCase
  def teacher
    @teacher ||= School::Teacher.new
  end

  def test_valid
    assert teacher.valid?
  end
end
