class AddUserToSensors < ActiveRecord::Migration[6.1]
  def change
    add_reference :sensors, :user, null: false, foreign_key: true
  end
end
