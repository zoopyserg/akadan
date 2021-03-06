class ActsAsCommentableWithThreadingMigration < ActiveRecord::Migration[6.1]
  def self.up
    create_table :comments, :force => true do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.text :body
      t.integer :user_id, :null => false
      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, [:commentable_id, :commentable_type]
  end

  def self.down
    drop_table :comments
  end
end
