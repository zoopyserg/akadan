class CreateSeminars < ActiveRecord::Migration[7.1]
  def change
    create_table :seminars do |t|
      t.string :name

      t.timestamps
    end
  end
end
