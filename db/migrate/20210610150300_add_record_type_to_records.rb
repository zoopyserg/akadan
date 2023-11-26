class AddRecordTypeToRecords < ActiveRecord::Migration[7.1]
  def change
    add_reference :records, :record_type, null: false, foreign_key: true
  end
end
