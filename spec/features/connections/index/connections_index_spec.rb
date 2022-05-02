require 'rails_helper'

RSpec.feature "ConnectionsIndices Permissions", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_connection) { create :connection, name: 'Public Connection', user: user, is_public: true }
  let!(:private_connection) { create :connection, name: 'Private Connection', user: user, is_public: false }

  context 'not signed in' do
    before { visit connections_path }

    it 'should stay on this page (no redirect)' do
      expect(current_path).to eq connections_path
    end

    it 'should show public connection types' do
      expect(page).to have_content 'Public Connection'
    end

    it 'should show my own connection types' do
      expect(page).to have_no_content 'Private Connection'
    end
  end

  context 'signed in' do
    before do
      login_as user
      visit connections_path
    end

    it 'should stay on this page (no redirect)' do
      expect(current_path).to eq connections_path
    end

    it 'should show public connection types' do
      expect(page).to have_content 'Public Connection'
    end

    it 'should show my own connection types' do
      expect(page).to have_content 'Private Connection'
    end
  end
end
