class AddRecordTypeToColumns < ActiveRecord::Migration[7.1]
  def change
    add_reference :columns, :record_type, null: true, foreign_key: true
  end
end
