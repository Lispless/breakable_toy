class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.fing(params[:id])
  end
end
