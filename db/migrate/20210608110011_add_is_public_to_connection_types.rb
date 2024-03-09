class AddIsPublicToConnectionTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :connection_types, :is_public, :boolean, default: true
  end
end
