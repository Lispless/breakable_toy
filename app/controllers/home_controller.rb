class HomeController < ApplicationController

  def index
    @user = User.new
    #@user_profile = UserProfile.new
  end
end
