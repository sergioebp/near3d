class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

  def initialize(user)
    user ||= User.new(role: 3)
    if user.client?
      can :read, Design, public: true
      can :create, Suggestion
      can :create, Design
      can [:read, :edit, :update, :destroy], Design, user_id: user.id
      can :read, Store, active: true
    elsif user.vendor?
      can :read, Design, public: true
      can :create, Suggestion
      can :create, Design
      can [:read, :edit, :update, :destroy], Design, user_id: user.id
      can :read, Store, active: true
      can [:read, :edit, :update, :destroy], Store do |store|
        store.users.where("user_id = #{current_user.id}").present?
      end
      can :create, Userstore
      can :delete, Userstore, user_id: user.id
    elsif user.admin?
      can :manage, :all
    else
      can :read, Design, public: true
      can :read, Store, active: true
    end
  end
end