class CreateConnections < ActiveRecord::Migration[7.1]
  def change
    create_table :connections do |t|
      t.string :name

      t.timestamps
    end
  end
end
