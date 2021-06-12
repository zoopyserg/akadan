require 'rails_helper'

RSpec.feature "ConnectionCreation Record A", type: :feature do
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
      visit new_connection_type_connection_path(connection_type)
    end

    it 'should let me create' do
      expect {
        create_connection('some connection', 'description', 'Regular Type', 'Record A', 'Record B')
      }.to change {
        user.connections.where(record_a_id: record_a.reload.id).count
      }.by(1)
    end

    # there are no other requirements for Record A, any record can have an OutGoing connection, all limitations about what record can be a Target.
  end
end
