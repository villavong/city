class PostsController < ApplicationController
  before_action :authenticate_student!
  # before_filter :require_permission
  before_action :find_student
  before_action :find_post, only: [:show, :edit, :update, :destroy]
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
    params.require(:post).permit(:title, :description, :post_photo)
  end

  def find_student

      @student = Student.find(params[:student_id])
  end

  def find_post
    @post = Post.find(params[:id])
  end
  # def require_permission
	# 	@student = Student.find(params[:student_id])
	# 	if current_student != @student
	# 		redirect_to root_path, notice: "Sorry, You're not allowed to view that page"
	# 	end
	# end


end
