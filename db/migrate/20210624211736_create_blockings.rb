class CreateBlockings < ActiveRecord::Migration[6.1]
  def change
    create_table :blockings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :blocked_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
