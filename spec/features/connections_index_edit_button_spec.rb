require 'rails_helper'

RSpec.feature "Edit Connections", type: :feature do
  context 'not signed in' do
    # skipping
  end

  context 'signed in', :focus do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:user2) { create :user }
    let!(:connection_type) { create :connection_type, user: the_user }
    let!(:record_a) { create :record, user: the_user }
    let!(:connection) { create :connection, name: 'name', user: the_user, record_a: record_a, connection_type: connection_type, is_public: true }

    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit edit_record_connection_type_connection_path(record_a, connection_type, connection)
    end

    # it also affects many people.
    # it could easily be recognized as a synonym for deletion.
    # I could easily claim that I should store previous edit versions and support rollback changes etc.
    # not sure now what to do
    context 'public someone elses' do
      let(:the_user) { user2 }
      let(:is_public) { true }

      it 'should not allow to edit' do
        expect(current_path).to eq connections_path
      end
    end

    context 'public my' do
      let(:the_user) { user }
      let(:is_public) { true }

      before { visit edit_record_connection_type_connection_path(record_a, connection_type, connection) }

      it 'should allow to edit' do
        fill_in 'connection_name', with: 'New Name'
        fill_in 'connection_description', with: 'New Description'
        click_on 'Save!'
        expect(connection.reload.name).to eq 'New Name'
        expect(connection.reload.description).to eq 'New Description'
      end
    end

    context 'private someone elses' do
      let(:the_user) { user2 }
      let(:is_public) { false }

      before { visit edit_record_connection_type_connection_path(record_a, connection_type, connection) }

      it 'should not allow to edit' do
        expect(current_path).to eq connections_path
      end
    end

    context 'private my' do
      let(:the_user) { user }
      let(:is_public) { false }

      before { visit edit_record_connection_type_connection_path(record_a, connection_type, connection) }

      it 'should allow to edit' do
        fill_in 'connection_name', with: 'New Name'
        click_on 'Save!'
        expect(connection.reload.name).to eq 'New Name'
      end
    end
  end
end
