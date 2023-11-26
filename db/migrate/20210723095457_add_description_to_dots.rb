class AddDescriptionToDots < ActiveRecord::Migration[7.1]
  def change
    add_column :dots, :description, :text
  end
end
