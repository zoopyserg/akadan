class AddFriendToFriendRequests < ActiveRecord::Migration[7.1]
  def change
    add_reference :friend_requests, :friend, null: false, foreign_key: { to_table: :users }
  end
end
