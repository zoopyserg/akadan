class PeopleController < ApplicationController
  def index
    if signed_in?
      @people = User.visible_users_for(current_user)
    else
      @people = User.where(is_public: true)
    end
  end
end
