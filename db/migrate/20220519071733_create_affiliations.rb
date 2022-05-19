class CreateAffiliations < ActiveRecord::Migration[6.1]
  def change
    create_table :affiliations do |t|
      t.belongs_to :group, index: true
      t.belongs_to :record_a, index: true, null: false, foreign_key: { to_table: :records }

      t.timestamps
    end
  end
end
