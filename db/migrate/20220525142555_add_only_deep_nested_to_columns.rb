class AddOnlyDeepNestedToColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :columns, :only_deep_nested, :boolean, default: false
  end
end
