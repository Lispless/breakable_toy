class UserProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user[:id])
    @profile = UserProfile.find(@user)
  end
end
