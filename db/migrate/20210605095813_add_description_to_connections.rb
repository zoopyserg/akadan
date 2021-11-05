class AddDescriptionToConnections < ActiveRecord::Migration[6.1]
  def change
    add_column :connections, :description, :text
  end
end
