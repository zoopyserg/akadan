class AddDestructiveToConnectionTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :connection_types, :destructive, :boolean
  end
end
