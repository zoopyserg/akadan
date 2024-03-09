class AddIsPublicToConnections < ActiveRecord::Migration[7.1]
  def change
    add_column :connections, :is_public, :boolean, default: true
  end
end
