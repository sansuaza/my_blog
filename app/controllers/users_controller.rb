class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[show]
  helper_method :current_user_owner?

  def show
    @user
  end

  def follow

    if @user && !current_user.is_followee?(@user)
      current_user.follow(@user)
      redirect_to :show
    end
  end

  def unfollow
    if @user && !current_user.is_followee?(@user)
      current_user.unfollow(@user)
      redirect_to :show
    end
  end

  private

  def set_user
    @user= User.find(params[:id])
  end

  def current_user_owner?
    current_user == @user
  end
end
