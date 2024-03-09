class AddAcceptTermsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :accept_terms, :boolean, default: false
  end
end
