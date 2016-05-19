class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    user ||= User.new

    if user.has_role? :admin
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
    end
  end
end
