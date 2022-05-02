require 'rails_helper'

RSpec.feature "Edit Connections", type: :feature do
  context 'not signed in' do
    # skipping
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:user2) { create :user }
    let!(:connection_type) { create :connection_type, user: the_user }
    let!(:record_a) { create :record, user: the_user }
    let!(:connection) { create :connection, name: 'name', user: the_user, record_a: record_a, connection_type: connection_type, is_public: true }

    before do
      login_as user, scope: :user
      visit connections_path
    end

    context 'public someone elses' do
      let(:the_user) { user2 }
      let(:is_public) { true }

      it 'should not allow to edit' do
        expect(page).to have_no_link 'Edit'
      end
    end

    context 'public my' do
      let(:the_user) { user }
      let(:is_public) { true }

      it 'should allow to edit' do
        expect(page).to have_link 'Edit'
        click_on 'Edit'
        expect(current_path).to eq edit_record_connection_type_connection_path(record_a, connection_type, connection)
      end
    end

    context 'private someone elses' do
      let(:the_user) { user2 }
      let(:is_public) { false }

      it 'should not allow to edit' do
        expect(page).to have_no_link 'Edit'
      end
    end

    context 'private my' do
      let(:the_user) { user }
      let(:is_public) { false }

      it 'should allow to edit' do
        expect(page).to have_link 'Edit'
        click_on 'Edit'
        expect(current_path).to eq edit_record_connection_type_connection_path(record_a, connection_type, connection)
      end
    end
  end
end
