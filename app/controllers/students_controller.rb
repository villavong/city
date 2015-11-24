class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :dashboard]


  def index
    @students = Student.all.order("created_at DESC")

  end
  def show
    @student = Student.find(params[:id])
  end

  def dashboard

  end
  private



  def find_student
    if params[:id].nil?
      @student = current_student
    else
      @student = Student.find(params[:id])
    end

  end

end
