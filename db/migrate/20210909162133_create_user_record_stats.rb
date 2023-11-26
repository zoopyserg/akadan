class CreateUserRecordStats < ActiveRecord::Migration[7.1]
  def change
    create_table :user_record_stats do |t|
      t.references :user, null: false, foreign_key: true
      t.references :record, null: false, foreign_key: true
      t.integer :records_connected_for_me_cached, default: 0
      t.integer :records_connected_for_others_cached, default: 0
      t.integer :solved_records_connected_for_me_cached, default: 0
      t.integer :solved_records_connected_for_others_cached, default: 0
      t.integer :unsolved_records_connected_for_me_cached, default: 0
      t.integer :unsolved_records_connected_for_others_cached, default: 0

      t.timestamps
    end
  end
end
