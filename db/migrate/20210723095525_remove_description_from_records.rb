class RemoveDescriptionFromRecords < ActiveRecord::Migration[7.1]
  def change
    remove_column :records, :description, :text
  end
end
