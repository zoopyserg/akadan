class PeopleController < ApplicationController
  def index
    if signed_in?
      @people = User.visible_users_for(current_user).page(params[:page]).per(50)
    else
      @people = User.where(is_public: true).page(params[:page]).per(50)
    end
  end
end
