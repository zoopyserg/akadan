class AddFilterSolvedStatusIdToColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :columns, :filter_solved_status_id, :integer, default: 0
  end
end
