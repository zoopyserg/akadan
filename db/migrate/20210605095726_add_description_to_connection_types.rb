class AddDescriptionToConnectionTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :connection_types, :description, :text
  end
end
