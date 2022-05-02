require 'rails_helper'

RSpec.feature "ConnectionCreation Success", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:connection_type) { create :connection_type, name: 'Regular Type', user: user }
  let!(:record_a) { create :record, :with_dot, name: 'Record A', user: user }
  let!(:record_b) { create :record, :with_dot, name: 'Record B', user: user }

  context 'not signed in' do
    it 'should redirect to sign in page' do
      visit new_record_connection_type_connection_path(record_a, connection_type)

      expect(current_path).to eq new_user_session_path
    end
  end

  context 'signed in' do
    before do
      login_as user
      visit new_record_connection_type_connection_path(record_a, connection_type)
    end

    it 'should let me create' do
      expect(page).to have_no_content 'successfully created'
      create_connection('some connection', 'description', 'Regular Type', 'Record A', 'Record B')

      expect(page).to have_content 'successfully created'
    end

    it 'should open index page' do
      create_connection('some connection', 'description', 'Regular Type', 'Record A', 'Record B')
      expect(current_path).to eq connections_path
    end
  end
end
