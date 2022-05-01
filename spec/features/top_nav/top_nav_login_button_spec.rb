require 'rails_helper'

RSpec.feature "Login Button", type: :feature do
  let!(:user) { create :user, :confirmed, :free }

  context 'non signed in' do
    before do
      visit root_path
    end

    it 'should have a login link' do
      within '.topbar-nav' do
        expect(page).to have_link 'Login', href: new_user_session_path
      end
    end
  end

  context 'signed in' do
    before { login_as(user, scope: :user) }
    before { visit root_path }

    it 'should not have a sign in button' do
      within '.topbar-nav' do
        expect(page).to_not have_link 'Login'
      end
    end
  end
end
