class AddDescriptionToConnectionTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :connection_types, :description, :text
  end
end
