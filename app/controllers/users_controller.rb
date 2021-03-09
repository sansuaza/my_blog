class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[show]
  def show
    @user
  end

  def follow
    p "---------------------- #{@user.id}"
    if(@user)
      current_user.follow(@user)
      p "---------------------- user followed"
    end
  end

  private
    def set_user
      @user= User.find(params[:id])
    end
end
