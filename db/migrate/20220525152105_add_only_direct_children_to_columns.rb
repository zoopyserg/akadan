class AddOnlyDirectChildrenToColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :columns, :only_direct_children, :boolean, default: false
  end
end
