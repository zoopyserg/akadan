require 'rails_helper'

RSpec.feature "NavNewChat Button", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  xcontext 'non signed in' do
    before do
      visit root_path
    end

    it 'should have a create link' do
    end
  end

  xcontext 'signed in' do
    before do
      visit new_user_session_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit root_path
    end

    it 'should let me create a blank conversation into which it did  not add any users except me and I can send there messsages to myself or add users later if I want' do
    end
  end
end
