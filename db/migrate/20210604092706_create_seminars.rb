class CreateSeminars < ActiveRecord::Migration[6.1]
  def change
    create_table :seminars do |t|
      t.string :name

      t.timestamps
    end
  end
end
