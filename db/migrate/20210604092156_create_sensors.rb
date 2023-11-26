class CreateSensors < ActiveRecord::Migration[7.1]
  def change
    create_table :sensors do |t|
      t.string :name

      t.timestamps
    end
  end
end
