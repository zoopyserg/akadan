class AddOneToManyToConnectionTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :connection_types, :one_to_many, :boolean, default: false
  end
end
