class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(current_user[:id])
    @post = Post.new(user_params)
    if @post.save
      redirect_to user_profiles_path(@user)
    else
      flash[:notice] = "Please correct the errors and try again"
      render :new
    end
  end

  def edit
    @user = User.find(current_user[:id])
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(user_params)
    redirect_to user_profiles_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Your post has been deleted."
    redirect_to user_profiles_path
  end

  def user_params
    params.require(:post).permit(:title, :body).merge(user: current_user)
  end
end
