class BlockingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_unblockable_user, only: :destroy
  before_action :set_blocking, only: :destroy

  def create
  end

  def destroy
    if @blocking.destroy
      respond_to do |format|
        format.html { redirect_to blocked_users_path }
      end
    else
      respond_to do |format|
        format.html { redirect_to blocked_users_path, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_unblockable_user
    @unblockable_user = current_user.blocked_users.find_by(id: params[:blocked_user_id]) if params[:blocked_user_id]
  end

  def set_blocking
    @blocking = current_user.blockings.find_by(blocked_user: @unblockable_user, id: params[:id]) if (@unblockable_user && params[:id])
  end
end
