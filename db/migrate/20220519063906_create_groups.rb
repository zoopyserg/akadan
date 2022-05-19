class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.belongs_to :record_b, index: true, null: true, foreign_key: { to_table: :records }
      t.belongs_to :connection_type, index: true, null: true
      t.belongs_to :user, index: true, null: false

      t.timestamps
    end
  end
end
