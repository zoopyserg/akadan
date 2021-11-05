class AddUserToConnectionTypes < ActiveRecord::Migration[6.1]
  def change
    add_reference :connection_types, :user, null: false, foreign_key: true
  end
end
