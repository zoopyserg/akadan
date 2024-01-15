class BlockedUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    pp '10000000'
    @blocked_users = current_user.blocked_users.page(params[:page])
  end
end
