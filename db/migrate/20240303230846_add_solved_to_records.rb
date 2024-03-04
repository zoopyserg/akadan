class AddSolvedToRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :records, :solved, :boolean, default: false
  end
end
