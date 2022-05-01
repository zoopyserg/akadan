require 'rails_helper'

RSpec.feature "Blocked Users Button", type: :feature do
  let!(:user) { create :user, :confirmed, :free }
  let(:dropdown_trigger) { '.dropdown-lg~ .dropdown-lg+ .nav-item .dropdown-toggle-nocaret' }

  context 'non signed in' do
    before do
      visit root_path
    end

    it 'should have a login link' do
      expect(page).to have_no_link 'Blocked Users'
      expect(page).to have_no_css dropdown_trigger
    end
  end

  context 'signed in' do
    before { login_as(user, scope: :user) }
    before { visit root_path }
    before { find(:css, dropdown_trigger).click }

    it 'should not have a sign in button' do
      within '.dropdown-menu-right' do
        expect(page).to have_link 'Blocked Users', href: blocked_users_path
      end
    end
  end
end
