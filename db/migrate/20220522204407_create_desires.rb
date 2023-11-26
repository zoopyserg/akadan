class CreateDesires < ActiveRecord::Migration[7.1]
  def change
    create_table :desires do |t|
      t.references :group, null: true, foreign_key: true, index: true
      t.references :design, null: true, foreign_key: true, index: true

      t.timestamps
    end
  end
end
