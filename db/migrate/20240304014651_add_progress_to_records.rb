class AddProgressToRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :records, :progress, :float, default: 0.0
  end
end
