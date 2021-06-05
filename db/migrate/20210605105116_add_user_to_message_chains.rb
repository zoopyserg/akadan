class AddUserToMessageChains < ActiveRecord::Migration[6.1]
  def change
    add_reference :message_chains, :user, null: false, foreign_key: true
  end
end
