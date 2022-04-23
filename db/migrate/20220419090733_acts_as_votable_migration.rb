class ActsAsVotableMigration < ActiveRecord::Migration[6.1]
  def self.up
    create_table :votes do |t|
      t.integer :votable_id
      t.string :votable_type
      t.integer :user_id, :null => false
      t.boolean :vote_flag

      t.timestamps
    end

    add_index :votes, :user_id
    add_index :votes, [:votable_id, :votable_type]
  end

  def self.down
    drop_table :votes
  end
end
