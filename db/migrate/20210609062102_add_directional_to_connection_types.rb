class AddDirectionalToConnectionTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :connection_types, :directional, :boolean
  end
end
