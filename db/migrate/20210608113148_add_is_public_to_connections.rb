class AddIsPublicToConnections < ActiveRecord::Migration[6.1]
  def change
    add_column :connections, :is_public, :boolean
  end
end
