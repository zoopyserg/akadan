require 'rails_helper'

RSpec.feature "Edit Connection Types Authorization", type: :feature do
  context 'not signed in' do
    # skipping
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:user2) { create :user }
    let!(:connection_type) { create :connection_type, name: 'name', user: the_user, is_public: true }

    before do
      login_as user
      visit edit_connection_type_path(connection_type)
    end

    # it also affects many people.
    # it could easily be recognized as a synonym for deletion.
    # I could easily claim that I should store previous edit versions and support rollback changes etc.
    # not sure now what to do
    context 'public someone elses' do
      let(:the_user) { user2 }
      let(:is_public) { true }

      it 'should not allow to edit' do
        expect(current_path).to eq connection_types_path
      end
    end

    context 'public my' do
      let(:the_user) { user }
      let(:is_public) { true }

      before { visit edit_connection_type_path(connection_type) }

      it 'should allow to edit' do
        fill_in 'connection_type_name', with: 'New Name'
        fill_in 'connection_type_description', with: 'New Description'
        click_on 'Save!'
        expect(connection_type.reload.name).to eq 'New Name'
        expect(connection_type.reload.description).to eq 'New Description'
      end
    end

    context 'private someone elses' do
      let(:the_user) { user2 }
      let(:is_public) { false }

      before { visit edit_connection_type_path(connection_type) }

      it 'should not allow to edit' do
        expect(current_path).to eq connection_types_path
      end
    end

    context 'private my' do
      let(:the_user) { user }
      let(:is_public) { false }

      before { visit edit_connection_type_path(connection_type) }

      it 'should allow to edit' do
        fill_in 'connection_type_name', with: 'New Name'
        click_on 'Save!'
        expect(connection_type.reload.name).to eq 'New Name'
      end
    end
  end
end
