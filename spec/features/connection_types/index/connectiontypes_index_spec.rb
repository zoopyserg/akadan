require 'rails_helper'

RSpec.feature "ConnectiontypesIndices", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_connection_type) { create :connection_type, name: 'Public Connection Type', user: user, is_public: true }
  let!(:private_connection_type) { create :connection_type, name: 'Private Connection Type', user: user, is_public: false }

  context 'not signed in' do
    before { visit connection_types_path }

    it 'should stay on this page (no redirect)' do
      expect(current_path).to eq connection_types_path
    end

    it 'should show public connection types' do
      expect(page).to have_content 'Public Connection Type'
    end

    it 'should show my own connection types' do
      expect(page).to have_no_content 'Private Connection Type'
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit connection_types_path
    end

    it 'should stay on this page (no redirect)' do
      expect(current_path).to eq connection_types_path
    end

    it 'should show public connection types' do
      expect(page).to have_content 'Public Connection Type'
    end

    it 'should show my own connection types' do
      expect(page).to have_content 'Private Connection Type'
    end
  end
end
