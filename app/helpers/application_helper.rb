module ApplicationHelper
  def current_user_owner?(user)
    current_user == user
  end

  def can_comment?(owner)
    following_user?(owner) || current_user == owner
  end

  def following_user?(user)
    current_user.following_user?(user)
  end
end
