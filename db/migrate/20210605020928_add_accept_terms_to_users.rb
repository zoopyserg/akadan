class AddAcceptTermsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :accept_terms, :boolean
  end
end
