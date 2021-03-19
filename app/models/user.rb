class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, foreign_key: 'owner_id'

  # Direct access to followship table
  has_many :follower_user_followships, class_name: 'Followship', foreign_key: 'follower_user_id',
            dependent: :destroy
  has_many :following_user_followships, class_name: 'Followship', foreign_key: 'following_user_id',
            dependent: :destroy

  has_many :follower_users, through: :following_user_followships
  has_many :following_users, through: :follower_user_followships

  validates :username, uniqueness: true, length: { minimum: 5}

  def follow(user)
    following_users << user
  end

  def unfollow(user_to_unfollow)
    following_users.delete user_to_unfollow
  end

  def following_user?(other_user)
    !(following_users.find { |following_user| following_user.id == other_user.id }).nil?
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
