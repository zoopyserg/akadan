class AddIsPublicToRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :records, :is_public, :boolean
  end
end
