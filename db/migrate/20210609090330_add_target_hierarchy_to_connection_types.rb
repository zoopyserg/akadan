class AddTargetHierarchyToConnectionTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :connection_types, :target_hierarchy, :string
  end
end
