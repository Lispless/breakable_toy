class UserProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user[:id])
    @profile = @user.user_profile
    @posts = Post.order("id DESC")
  end

  def new
    @profile = UserProfile.new
  end

  def create
    @user = User.find(current_user[:id])
    @profile = UserProfile.new(user_params)
    if @profile.save
      redirect_to user_profile_index_path(@user)
    else
      flash[:notice] = "Please correct the errors and try again"
      render :new
    end
  end

  def edit
    @user = User.find(current_user[:id])
    @profile = @user.user_profile
  end

  def update
    @profile = UserProfile.find(params[:id])
    @profile.update(user_params)
    redirect_to user_profiles_path
  end

  def user_params
     params.require(:user_profile).permit(:motto, :bio, :interests).merge(user: current_user)
  end
end
