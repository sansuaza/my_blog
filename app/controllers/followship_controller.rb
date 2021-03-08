class FollowshipController < ApplicationController
  load_and_authorize_resource
  before_action :set_followship, :set_followee_users, only: %i[unfollow index]
  before_action :set_unfollowed_user, only: %i[unfollowees]

  def followees
    @followee_users
  end

  def unfollowees
    p "usuarios que no los sigue #{@unfollowee_users}"
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

    def set_unfollowed_user
      @all_users= User.all

      @followee_users = User.joins(:followships).where(
        "id = ? OR followships.follower_id = ?",
        current_user.id,
        current_user.id
      ).group(:id)

      @unfollowee_users = [@all_users] - [@followee_users]
    end

    def find_user
      User.find(params[:id])
    end

    def find_followship(id_follower, id_followee)
      Followship.find(followee: id_followee, follower: id_follower)
    end

    def set_followship
      @followship = Followship.find(followee: params[:id], follower: current_user)
    end

    def set_followee_users
      @followee_users = User.joins(:followships).where(
        "id = ? OR followships.follower_id = ?",
        current_user.id,
        current_user.id
      )
    end

    def followship_params
      params.require(:followship).permit(:followee)
    end

end
