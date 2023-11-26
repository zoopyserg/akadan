class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = User.visible_friends_for(current_user).page(params[:page]).per(50)
  end
end
