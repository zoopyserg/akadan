require 'rails_helper'

RSpec.feature "NavMessagesButtons", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  context 'non signed in' do
    before do
      visit root_path
    end

    it 'should have a login link' do
      within '.sidebar-menu' do
        expect(page).not_to have_link 'My Messages'
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
        click_on 'My Messages'
      end

      expect(current_path).to eq conversations_path
    end
  end
end
