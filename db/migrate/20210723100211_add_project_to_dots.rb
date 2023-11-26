class AddProjectToDots < ActiveRecord::Migration[7.1]
  def change
    add_reference :dots, :project, null: false, foreign_key: { to_table: :records }
  end
end
