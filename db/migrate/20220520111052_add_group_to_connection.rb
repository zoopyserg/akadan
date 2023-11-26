class AddGroupToConnection < ActiveRecord::Migration[7.1]
  def change
    add_reference :connections, :group, null: true, foreign_key: true
  end
end
