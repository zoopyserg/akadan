class AddSeparateProjectToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :separate_project, :boolean, default: false
  end
end
