class AddShouldSolveToRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :records, :should_solve, :boolean, default: false
  end
end
