require 'rails_helper'

RSpec.feature "ConnectionCreations Connection Type", type: :feature do
  context 'not signed in' do
    # skipping because it is tested in Success
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:user2) { create :user }

    describe 'public/private connection types' do
      context 'public' do
        let!(:connection_type) { create :connection_type, name: 'Regular Type', user: user2, is_public: true }
        let!(:record_a) { create :record, :with_dot, name: 'Record A', user: user }
        let!(:record_b) { create :record, :with_dot, name: 'Record B', user: user }

        before do
          login_as user
          visit new_record_connection_type_connection_path(record_a, connection_type)
        end

        it 'should let me create by selecting the connection type' do
          expect {
            create_connection('some connection', 'description', 'Regular Type', 'Record A', 'Record B')
          }.to change {
            user.connections.where(connection_type: connection_type.reload.id).count
          }.by(1)
        end
      end

      context 'private mine' do
        let!(:connection_type) { create :connection_type, name: 'Regular Type', user: user }
        let!(:record_a) { create :record, :with_dot, name: 'Record A', user: user }
        let!(:record_b) { create :record, :with_dot, name: 'Record B', user: user }

        before do
          login_as user
          visit new_record_connection_type_connection_path(record_a, connection_type)
        end

        it 'should let me create by selecting the connection type' do
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
            choose_something('Record A', '.record_a_selection_section')
            choose_something('Record B', '.record_b_selection_section')
            click_on 'Create!'
          }.to change {
            user.connections.where(connection_type: connection_type.reload.id).count
          }.by(1)
        end
      end

      context 'private someone elses' do
        let!(:connection_type) { create :connection_type, name: 'Not My Type', user: user2, is_public: false }
        let!(:my_connection_type) { create :connection_type, name: 'My Type', user: user, is_public: false }
        let!(:record_a) { create :record, :with_dot, name: 'Record A', user: user }
        let!(:record_b) { create :record, :with_dot, name: 'Record B', user: user }

        before do
          login_as user
          visit new_record_connection_type_connection_path(record_a, my_connection_type)
        end

        it { expect_dropdown_to_contain_option('.connection_type_selection_section', 'My Type') }
        it { expect_dropdown_not_to_contain_option('.connection_type_selection_section', 'Not My Type') }
      end
    end
  end

  # note that I'm not reloading the selection options if I picked a different connection type.
  # which I should.
  xit 'should reload a page to new connection type path when I picked a new type from dropdown'
end
