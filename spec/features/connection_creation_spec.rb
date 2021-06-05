require 'rails_helper'

RSpec.feature "ConnectionCreations", type: :feature do
  context 'not signed in' do
    it 'should redirect to sign in page' do
      visit new_connection_path

      expect(current_path).to eq new_user_session_path
    end
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit new_connection_path
    end

    it 'should let me create' do
      expect(page).to have_no_content 'successfully created'
      create_connection('some connection', 'description')

      expect(page).to have_content 'successfully created'
    end
  end
end
