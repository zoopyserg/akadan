class CreateColumns < ActiveRecord::Migration[7.1]
  def change
    create_table :columns do |t|
      t.belongs_to :design, null: false, index: true, foreign_key: true
      t.boolean :collapsed, default: false

      t.timestamps
    end
  end
end
