module ApplicationHelper
  def current_user_owner?(user)
    current_user == user
  end

  def can_comment?(owner)
    current_user.following_user?(owner)||current_user==owner
  end
end
