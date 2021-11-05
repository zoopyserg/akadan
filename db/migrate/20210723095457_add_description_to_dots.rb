class AddDescriptionToDots < ActiveRecord::Migration[6.1]
  def change
    add_column :dots, :description, :text
  end
end
