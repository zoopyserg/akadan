class AddIsPublicToSensors < ActiveRecord::Migration[7.1]
  def change
    add_column :sensors, :is_public, :boolean, default: true
  end
end
