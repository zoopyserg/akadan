class BlockedUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @blocked_users = current_user.blocked_users.page(params[:page])
  end
end
