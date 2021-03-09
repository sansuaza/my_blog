class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles

  # Direct access to followship table
  has_many :follower_followships, class_name: 'Followship', foreign_key: 'follower_id',
                                    dependent: :destroy
  has_many :followee_followships, class_name: 'Followship', foreign_key: 'followee_id',
  dependent: :destroy

  has_many :followers, through: :follower_followships
  has_many :followees, through: :followee_followships

  def follow(user)
    p "------------------------- user to follow #{user.email}"
    followees.push user
  end

  def unfollow(followed_user)
    followees.delete followed_user
  end

  def is_followee?(other_user)
    !(followees.find { |user| user.id == other_user.id }).nil?
  end

end
