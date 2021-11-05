class AddUserToFriendRequests < ActiveRecord::Migration[6.1]
  def change
    add_reference :friend_requests, :user, null: false, foreign_key: true
  end
end
