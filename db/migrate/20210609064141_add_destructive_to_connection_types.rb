class AddDestructiveToConnectionTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :connection_types, :destructive, :boolean
  end
end
