require 'rails_helper'

RSpec.feature "NavBlockedUsers Button", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  context 'non signed in' do
    before do
      visit root_path
    end

    it 'should have a login link' do
      within '.sidebar-menu' do
        expect(page).not_to have_link 'Blocked Users'
      end
    end
  end

  context 'signed in' do
    before do
      visit new_user_session_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit root_path
    end

    it 'should not have a sign in button' do
      within '.sidebar-menu' do
        click_on 'Blocked Users'
      end

      expect(current_path).to eq blocked_users_path
    end
  end
end
