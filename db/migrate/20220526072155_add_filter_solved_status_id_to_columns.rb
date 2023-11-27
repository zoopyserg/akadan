class AddFilterSolvedStatusIdToColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :columns, :filter_solved_status, :integer, default: 0
  end
end
