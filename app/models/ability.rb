class Ability
  include CanCan::Ability

  def initialize user
    return unless user
    if user.has_role? :admin
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
    else
      can :read, :all
    end
  end
end
