require 'rails_helper'

RSpec.feature "Edit Record Type button visibility", type: :feature do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }

  let!(:record_type) { create(:record_type, user: user1) }

  context "user logged in" do
    context 'user created type' do
      before { login_as(user1, scope: :user) }
      before { visit record_types_path }

      it { expect(page).to have_link('Edit', href: edit_record_type_path(record_type)) }
    end

    context 'someone else created type' do
      before { login_as(user2, scope: :user) }
      before { visit record_types_path }

      it { expect(page).not_to have_link('Edit', href: edit_record_type_path(record_type)) }
    end
  end

  context "user not logged in" do
    before { visit record_types_path }

    it { expect(page).not_to have_link('Edit', href: edit_record_type_path(record_type)) }
  end
end
