class AddClosestParentTypeToConnectionTypes < ActiveRecord::Migration[7.1]
  def change
    add_reference :connection_types, :closest_parent_type, null: true, foreign_key: { to_table: :record_types }
  end
end
