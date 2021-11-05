class Blocking < ApplicationRecord
  belongs_to :user
  belongs_to :blocked_user, class_name: 'User'

  before_create :destroy_friendship

  private
  def destroy_friendship
    FriendRequest.where(user: user, friend: blocked_user).destroy_all
    FriendRequest.where(user: blocked_user, friend: user).destroy_all
  end
end
