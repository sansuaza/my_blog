class Followship < ApplicationRecord
  belongs_to :follower_user, class_name: "User"
  belongs_to :following_user, class_name: "User"

  validates :follower_user_id, :following_user_id ,presence: true
end
