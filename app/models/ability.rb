class Ability
  include CanCan::Ability

  def initialize user
    return unless user
    if user.is_admin?
      can :manage, :all
    else
      can :read, [Course, User]
      can :create, Examination
      can [:update, :show], Examination, user_id: user.id
    end
  end
end
