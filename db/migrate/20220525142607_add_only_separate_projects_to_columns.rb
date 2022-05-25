class AddOnlySeparateProjectsToColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :columns, :only_separate_projects, :boolean, default: false
  end
end
