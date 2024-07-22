# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all

    if user.super_admin?
      can :manager, Company, :all
    elsif user.admin?
      can :read, Company, :all
    end
  end
end
