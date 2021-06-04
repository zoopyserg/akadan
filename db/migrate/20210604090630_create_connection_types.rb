class CreateConnectionTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :connection_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
