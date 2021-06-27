class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_unblockable_user, only: [:reject, :unfriend]
  before_action :set_requests, only: [:reject, :unfriend]

  def create
    if current_user.friend_requests.create friend_id: params[:friend_id]
      respond_to do |format|
        format.html { redirect_to friends_path }
      end
    else
      respond_to do |format|
        format.html { redirect_to friends_path, status: :unprocessable_entity }
      end
    end
  end

  def accept
    if current_user.friend_requests.create friend_id: params[:friend_id]
      respond_to do |format|
        format.html { redirect_to friends_path }
      end
    else
      respond_to do |format|
        format.html { redirect_to friends_path, status: :unprocessable_entity }
      end
    end
  end

  def reject
    if @friend_requests.destroy_all
      respond_to do |format|
        format.html { redirect_to friends_path }
      end
    else
      respond_to do |format|
        format.html { redirect_to friends_path, status: :unprocessable_entity }
      end
    end
  end

  def unfriend
    if @friend_requests.destroy_all
      respond_to do |format|
        format.html { redirect_to friends_path }
      end
    else
      respond_to do |format|
        format.html { redirect_to friends_path, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_unblockable_user
    @friend = User.find_by(id: params[:friend_id]) if params[:friend_id]
  end

  def set_requests
    @friend_requests = FriendRequest.where(user: current_user, friend: @friend).or(FriendRequest.where(user: @friend, friend: current_user)) if @friend
  end
end
