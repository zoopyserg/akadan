class PeopleController < ApplicationController
  def index
    if signed_in?
      @people = User.visible_users_for(current_user).page(params[:page])
    else
      @people = User.where(is_public: true).page(params[:page])
    end
  end
end
