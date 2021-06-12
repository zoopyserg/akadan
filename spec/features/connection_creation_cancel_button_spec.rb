require 'rails_helper'

RSpec.feature "ConnectionCreations Cancel Button", type: :feature do
  context 'not signed in' do
    # skipping because it is tested in Success
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:connection_type) { create :connection_type, name: 'Regular Type', user: user }
    let!(:record_a) { create :record, name: 'Record A', user: user }
    let!(:record_b) { create :record, name: 'Record B', user: user }

    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit new_connection_path
    end

    it 'should let me create' do
      expect {
        click_on 'Cancel'
      }.to change {
        user.connections.count
      }.by(0)
    end

    it 'should open index page' do
      click_on 'Cancel'
      expect(current_path).to eq connections_path
    end
  end
end
