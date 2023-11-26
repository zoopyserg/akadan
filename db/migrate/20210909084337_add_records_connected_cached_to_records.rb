class AddRecordsConnectedCachedToRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :records, :records_connected_cached, :integer, default: 0
    add_column :records, :solved_records_connected_cached, :integer, default: 0
    add_column :records, :unsolved_records_connected_cached, :integer, default: 0
    add_column :records, :progress_cached, :integer, default: 0
  end
end
