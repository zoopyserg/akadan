class AddDescriptionToRecordTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :record_types, :description, :text
  end
end
