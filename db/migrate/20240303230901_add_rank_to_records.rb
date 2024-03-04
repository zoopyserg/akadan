class AddRankToRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :records, :rank, :float, default: 0.0
  end
end
