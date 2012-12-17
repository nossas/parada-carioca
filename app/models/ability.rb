class Ability
  include CanCan::Ability

  def initialize(user)


    can :read, Activity
    can :search, Activity

    if user
      can :create, Activity
      can :update, Activity, user_id: user.id
    end
  end
end
