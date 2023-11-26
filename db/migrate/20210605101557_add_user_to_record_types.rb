class AddUserToRecordTypes < ActiveRecord::Migration[7.1]
  def change
    add_reference :record_types, :user, null: false, foreign_key: true
  end
end
