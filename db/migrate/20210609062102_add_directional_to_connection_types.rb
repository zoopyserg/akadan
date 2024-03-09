class AddDirectionalToConnectionTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :connection_types, :directional, :boolean, default: false
  end
end
