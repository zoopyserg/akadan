require 'rails_helper'

RSpec.feature "Edit Connection Type button visibility", type: :feature do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }

  let!(:connection_type) { create(:connection_type, user: user1) }

  context "user logged in" do
    context 'user created type' do
      before { login_as(user1, scope: :user) }
      before { visit connection_types_path }

      it { expect(page).to have_link('Edit', href: edit_connection_type_path(connection_type)) }
    end

    context 'someone else created type' do
      before { login_as(user2, scope: :user) }
      before { visit connection_types_path }

      it { expect(page).not_to have_link('Edit', href: edit_connection_type_path(connection_type)) }
    end
  end

  context "user not logged in" do
    before { visit connection_types_path }

    it { expect(page).not_to have_link('Edit', href: edit_connection_type_path(connection_type)) }
  end
end
