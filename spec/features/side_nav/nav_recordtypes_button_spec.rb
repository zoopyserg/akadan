require 'rails_helper'

RSpec.feature "NavRecordTypes Button", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  context 'non signed in' do
    before do
      visit root_path
    end

    it 'should have a login link' do
      within '.sidebar-menu' do
        click_on 'Types of Repetitive Records'
      end

      expect(current_path).to eq record_types_path
    end
  end

  context 'signed in' do
    before { login_as(user, scope: :user) }
    before { visit root_path }

    it 'should not have a sign in button' do
      within '.sidebar-menu' do
        click_on 'Types of Repetitive Records'
      end

      expect(current_path).to eq record_types_path
    end
  end
end
