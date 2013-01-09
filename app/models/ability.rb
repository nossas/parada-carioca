class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Activity
    can :read, Participation
    can :search, Activity
    can :moip_callback, Participation

    if user
      can :create, Activity
      can :update, Activity, user_id: user.id
      can :create, Participation
      can :manage, User, :id => user.id
      can :manage, Event do |event|
        event.activity.user_id = user.id
      end
    end
  end
end
