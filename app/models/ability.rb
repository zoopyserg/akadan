# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :update, RecordType, user: user if user.present?
  end
end
