class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[show follow unfollow]
  helper_method :current_user_owner?

  def show
    @user
  end

  def follow
    if @user && !current_user.following_user?(@user)
      current_user.follow(@user)
      redirect_to "/users/show/#{@user.username}"
    end
  end

  def unfollow
    if @user && current_user.following_user?(@user)
      current_user.unfollow(@user)
      redirect_to "/users/show/#{@user.username}"
    end
  end

  private

  def set_user
    @user= User.find_by( username: params[:username])
  end
end
