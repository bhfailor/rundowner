require "test_helper"

class School::TeachersControllerTest < ActionController::TestCase
  def school_teacher
    @school_teacher ||= school_teachers :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:school_teachers)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("School::Teacher.count") do
      post :create, school_teacher: { name: school_teacher.name }
    end

    assert_redirected_to school_teacher_path(assigns(:school_teacher))
  end

  def test_show
    get :show, id: school_teacher
    assert_response :success
  end

  def test_edit
    get :edit, id: school_teacher
    assert_response :success
  end

  def test_update
    put :update, id: school_teacher, school_teacher: { name: school_teacher.name }
    assert_redirected_to school_teacher_path(assigns(:school_teacher))
  end

  def test_destroy
    assert_difference("School::Teacher.count", -1) do
      delete :destroy, id: school_teacher
    end

    assert_redirected_to school_teachers_path
  end
end
