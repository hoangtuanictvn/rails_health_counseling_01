class Ability
  include CanCan::Ability

  def initialize user
    if user.nil?
      can :read, :all
    elsif user.admin?
      can :manage, :all
    elsif user.is_a? Doctor
      can :read, :all
      can :manage, Doctor, id: user.id
      can :manage, [Question, Answer, Like], user_id: user.id
    else
      can :read, :all
      can :manage, User, id: user.id
      can :manage, [Question, Answer, Like], user_id: user.id
      can :create, Booking, user_id: user.id
    end
  end
end
