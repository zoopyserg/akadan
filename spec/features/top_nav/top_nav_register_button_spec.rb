require 'rails_helper'

RSpec.feature "NavConnections Button", type: :feature do
  let!(:user) { create :user, :confirmed, :free }

  context 'non signed in' do
    before do
      visit root_path
    end

    it 'should have a login link' do
      within '.topbar-nav' do
        expect(page).to have_css "a[href='#{new_user_registration_path}']"
      end
    end
  end

  context 'signed in' do
    before { login_as(user, scope: :user) }
    before { visit root_path }

    it 'should not have a sign in button' do
      within '.topbar-nav' do
        expect(page).to have_no_css "a[href='#{new_user_registration_path}']"
      end
    end
  end
end
