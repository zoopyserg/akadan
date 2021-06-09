class AddOneToManyToConnectionTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :connection_types, :one_to_many, :boolean
  end
end
