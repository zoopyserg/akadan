class RemoveDescriptionFromRecords < ActiveRecord::Migration[6.1]
  def change
    remove_column :records, :description, :text
  end
end
