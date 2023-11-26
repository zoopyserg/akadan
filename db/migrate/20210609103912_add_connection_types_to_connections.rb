class AddConnectionTypesToConnections < ActiveRecord::Migration[7.1]
  def change
    add_reference :connections, :connection_type, null: false, foreign_key: true
  end
end
