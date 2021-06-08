class AddIsPublicToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :is_public, :boolean
  end
end
