require 'rails_helper'

RSpec.feature "ConnectionCreation Record A", type: :feature do
  context 'not signed in' do
    # skipping because it is tested in Success
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:user2) { create :user }

    context 'public' do
      let!(:connection_type) { create :connection_type, name: 'Regular Type', user: user2, is_public: true }
      let!(:record_a) { create :record, name: 'Record A', user: user2, is_public: true }
      let!(:record_b) { create :record, name: 'Record B', user: user2, is_public: true }

      before do
        login_as user
        visit new_record_connection_type_connection_path(record_a, connection_type)
      end

      it 'should let me create by selecting the record' do
        expect {
          create_connection('some connection', 'description', 'Regular Type', 'Record A', 'Record B')
        }.to change {
          user.connections.where(record_a_id: record_a.reload.id).count
        }.by(1)
      end

      it 'should autoselect the record a if it was submitted via params' do
        expect {
          fill_in 'connection_name', with: 'some connection'
          fill_in 'connection_description', with: 'description'
          select 'Regular Type', from: :connection_connection_type_id
          # skipping Record A Selection on purpose to test autoselect
          select 'Record B', from: :connection_record_b_id
          click_on 'Create!'
        }.to change {
          user.connections.where(record_a_id: record_a.reload.id).count
        }.by(1)
      end
    end

    context 'private someone elses' do
      let!(:connection_type) { create :connection_type, name: 'Regular Type', user: user2 }
      let!(:record_a) { create :record, name: 'Record A', user: user2 }
      let!(:record_b) { create :record, name: 'Record B', user: user2 }

      before do
        login_as user
        visit new_record_connection_type_connection_path(record_a, connection_type)
      end

      it 'should redirect me to connections path' do
        expect(current_path).to eq connections_path
      end
    end

    context 'private mine' do
      let!(:connection_type) { create :connection_type, name: 'Regular Type', user: user }
      let!(:record_a) { create :record, name: 'Record A', user: user }
      let!(:record_b) { create :record, name: 'Record B', user: user }

      before do
        login_as user
        visit new_record_connection_type_connection_path(record_a, connection_type)
      end

      it 'should let me create by selecting the record' do
        expect {
          create_connection('some connection', 'description', 'Regular Type', 'Record A', 'Record B')
        }.to change {
          user.connections.where(record_a_id: record_a.reload.id).count
        }.by(1)
      end

      it 'should autoselect the record a if it was submitted via params' do
        expect {
          fill_in 'connection_name', with: 'some connection'
          fill_in 'connection_description', with: 'description'
          select 'Regular Type', from: :connection_connection_type_id
          # skipping Record A Selection on purpose to test autoselect
          select 'Record B', from: :connection_record_b_id
          click_on 'Create!'
        }.to change {
          user.connections.where(record_a_id: record_a.reload.id).count
        }.by(1)
      end
    end
  end
end
