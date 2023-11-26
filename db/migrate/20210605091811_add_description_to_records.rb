class AddDescriptionToRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :records, :description, :text
  end
end
