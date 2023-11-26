class AddIsPublicToRecordTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :record_types, :is_public, :boolean
  end
end
