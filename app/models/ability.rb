# frozen_string_literal: true
class Ability
  include CanCan::Ability

  # User who made the request
  def initialize(user)
    # defined what can any user do with and article,
    # Had to be specified the relation between user and article (owner : user.id)
    can :manage, Article, owner: user
    can :read, Article
    can :manage, Followship
    can :manage, User
  end
end
