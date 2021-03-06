require 'rails_helper'

RSpec.feature "NavOnlineSell Button", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  xcontext 'non signed in' do
    before do
      visit root_path
    end

    it 'should have a create link' do
      within '.sidebar-menu' do
        expect(page).not_to have_link 'Notifications'
      end
    end
  end

  xcontext 'signed in' do
    before { login_as(user, scope: :user) }
    before { visit root_path }

    it 'should not have a sign in button' do
      within '.sidebar-menu' do
        click_on 'Notifications'
      end

      expect(current_path).to eq notifications_path
    end
  end
end
