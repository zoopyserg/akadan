require 'rails_helper'

RSpec.feature "ConnectionCreations Connection Type", type: :feature do
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
      visit new_record_connection_type_connection_path(record_a, connection_type)
    end

    it 'should let me create by selecting the record' do
      expect {
        create_connection('some connection', 'description', 'Regular Type', 'Record A', 'Record B')
      }.to change {
        user.connections.where(connection_type: connection_type.reload.id).count
      }.by(1)
    end

    it 'should autoselect the connection type' do
      expect {
        fill_in 'connection_name', with: 'some connection'
        fill_in 'connection_description', with: 'description'
        # skipping type selection on purpose to check autoselect
        select 'Record A', from: :connection_record_a_id
        select 'Record B', from: :connection_record_b_id
        click_on 'Create!'
      }.to change {
        user.connections.where(connection_type: connection_type.reload.id).count
      }.by(1)
    end

    describe 'public/private connection types' do
      xit 'pending'

    end
  end

  # note that I'm not reloading the selection options if I picked a different connection type.
  # which I should.
end
