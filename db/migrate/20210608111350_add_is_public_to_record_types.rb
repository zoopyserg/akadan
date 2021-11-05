class AddIsPublicToRecordTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :record_types, :is_public, :boolean
  end
end
