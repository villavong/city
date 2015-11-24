class PostsController < ApplicationController
  before_action :find_student
  before_action :find_post, only: [:new, :show, :edit, :update, :destroy]
  def new
    @post = @student.posts.new
  end

  def create
    @post = @student.posts.new post_params
    if @post.save
      redirect_to student_post_path(@student, @post)
    else
      render 'new'
    end

  end
  def show

    @posts = Post.where(student_id: @student).order("created_at DESC").reject { |e| e.id == @post.id}

  end

  def edit

  end

  def update
    if @post.update post_params
      redirect_to student_post_path(@student, @post), notice: "Post was Successfully Updated!!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

  def find_student
    if params[:id].nil?
      @student = current_student
    else
      @student = Student.find(params[:id])
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
