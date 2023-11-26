class CreateBlockedUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :blocked_users do |t|
      t.string :name

      t.timestamps
    end
  end
end
