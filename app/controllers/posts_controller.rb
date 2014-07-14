class PostsController < ApplicationController

  def show
    @posts = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_profiles_path(current_user)
    else
      flash[:notice] = "Please correct the errors and try again"
      render :new
    end
  end

  def edit
    @user = User.find(current_user[:id])
    @post = @user.post
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to user_profiles_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Your post has been deleted."
    redirect_to user_profiles_path
  end

  def post_params
    params.require(:post).permit(:title, :body).merge(user: current_user)
  end
end
