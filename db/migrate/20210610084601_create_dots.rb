class CreateDots < ActiveRecord::Migration[7.1]
  def change
    create_table :dots do |t|
      t.references :record, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :duration

      t.timestamps
    end
  end
end
