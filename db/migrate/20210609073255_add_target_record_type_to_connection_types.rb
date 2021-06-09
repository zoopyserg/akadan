class AddTargetRecordTypeToConnectionTypes < ActiveRecord::Migration[6.1]
  def change
    add_reference :connection_types, :target_record_type, null: true, foreign_key: { to_table: :record_types }
  end
end
