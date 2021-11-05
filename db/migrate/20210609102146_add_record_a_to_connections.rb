class AddRecordAToConnections < ActiveRecord::Migration[6.1]
  def change
    add_reference :connections, :record_a, null: false, foreign_key: { to_table: :records }
  end
end
