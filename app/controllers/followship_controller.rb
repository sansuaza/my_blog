class FollowshipController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[show]
  #before_action :set_unfollowed_user, only: %i[followees]

  def show
    @user
  end

  def unfollowees
    @unfollowee_users
  end

  def create
    unless find_followship
      current_user.follow( find_user )
    end
  end

  def destroy
    if find_followship
      current_user.unfollow( find_user )
    end
  end

  private

    def set_user
      @user= User.find(params[:id])
    end
#
    #def find_followship(id_follower, id_followee)
    #  Followship.find(followee: id_followee, follower: id_follower)
    #end
#
    #def set_followship
    #  @followship = Followship.find(followee: params[:id], follower: current_user)
    #end
#
    def followship_params
      params.require(:followship).permit(:followee)
    end
end
