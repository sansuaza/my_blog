module ApplicationHelper
  def current_user_owner?(user)
    current_user == user
  end

  def can_comment?(owner)
    followhing_user?(owner)||current_user==owner
  end

  def followhing_user?(user)
    current_user.following_user?(user)
  end
end
