class CreateDesigns < ActiveRecord::Migration[6.1]
  def change
    create_table :designs do |t|
      t.belongs_to :user, index: true
      t.belongs_to :designable, polymorphic: true, index: true
      t.boolean :is_public, default: false

      t.timestamps
    end
  end
end
