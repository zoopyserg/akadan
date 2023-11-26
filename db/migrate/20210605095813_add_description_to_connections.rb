class AddDescriptionToConnections < ActiveRecord::Migration[7.1]
  def change
    add_column :connections, :description, :text
  end
end
