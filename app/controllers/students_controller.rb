class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :dashboard]
  before_action :find_post, only: [:show, :dashboard]



  def index
    @students = Student.all.order("created_at DESC")

  end
  def show

  end

  def dashboard

  end


  
  private

  def find_post
    @posts = Post.where(student_id: @student).order("created_at DESC")

  end

  def find_student
    if params[:id].nil?
      @student = current_student
    else
      @student = Student.find(params[:id])
    end

  end




end
