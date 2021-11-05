class AddDescriptionToSensors < ActiveRecord::Migration[6.1]
  def change
    add_column :sensors, :description, :text
  end
end
