class AddSenderToMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :sender, null: false, foreign_key: { to_table: :users }
  end
end
