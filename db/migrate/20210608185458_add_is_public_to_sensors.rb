class AddIsPublicToSensors < ActiveRecord::Migration[6.1]
  def change
    add_column :sensors, :is_public, :boolean
  end
end
