require "test_helper"

class College::TeacherTest < ActiveSupport::TestCase
  def teacher
    @teacher ||= College::Teacher.new
  end

  def test_valid
    assert teacher.valid?
  end
end
