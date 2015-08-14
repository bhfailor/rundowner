class School::TeachersController < ApplicationController
  before_action :set_school_teacher, only: [:show, :edit, :update, :destroy]

  # GET /school/teachers
  # GET /school/teachers.json
  def index
    @school_teachers = School::Teacher.all
  end

  # GET /school/teachers/1
  # GET /school/teachers/1.json
  def show
  end

  # GET /school/teachers/new
  def new
    require 'pry'
    binding.pry
    @school_teacher = School::Teacher.new
  end

  # GET /school/teachers/1/edit
  def edit
  end

  # POST /school/teachers
  # POST /school/teachers.json
  def create
    @school_teacher = School::Teacher.new(school_teacher_params)

    respond_to do |format|
      if @school_teacher.save
        format.html { redirect_to @school_teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @school_teacher }
      else
        format.html { render :new }
        format.json { render json: @school_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school/teachers/1
  # PATCH/PUT /school/teachers/1.json
  def update
    respond_to do |format|
      if @school_teacher.update(school_teacher_params)
        format.html { redirect_to @school_teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_teacher }
      else
        format.html { render :edit }
        format.json { render json: @school_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school/teachers/1
  # DELETE /school/teachers/1.json
  def destroy
    @school_teacher.destroy
    respond_to do |format|
      format.html { redirect_to school_teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_teacher
      @school_teacher = School::Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_teacher_params
      params.require(:school_teacher).permit(:name)
    end
end
