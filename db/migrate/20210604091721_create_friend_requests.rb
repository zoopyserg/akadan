class CreateFriendRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :friend_requests do |t|
      t.timestamps
    end
  end
end
