require 'rails_helper'

RSpec.feature "Delete Connections", type: :feature do
  context 'not signed in' do
    # skipping
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit connections_path
    end

    it 'there is no deletion button for connections' do

    end
  end
end
