class AddDescriptionToSensors < ActiveRecord::Migration[7.1]
  def change
    add_column :sensors, :description, :text
  end
end
