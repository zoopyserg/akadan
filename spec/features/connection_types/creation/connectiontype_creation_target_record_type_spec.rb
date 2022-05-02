require 'rails_helper'

RSpec.feature "ConnectionTypeCreation Target Record Type", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:record_type) { create :record_type, name: 'My Type', user: user, is_public: true }

    before do
      login_as user
      visit new_connection_type_path
    end

    context 'same_as_source' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_target_type_same_as_source
          click_on 'Create!'
        }.to change {
          user.connection_types.where(target_type: 'same_as_source').count
        }.by(1)
      end
    end

    context 'any' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_target_type_any
          click_on 'Create!'
        }.to change {
          user.connection_types.where(target_type: 'any').count
        }.by(1)
      end
    end

    context 'specific_type' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          within '#specificTypeContainer' do # todo: test what happens if I don't select parent type (there was an issue in some template with this)
            choose_record_type('My Type')
          end
          within '#specificSubTypeContainer' do
            choose_record_type('My Type')
          end
          choose :connection_type_target_type_specific_type
          click_on 'Create!'
        }.to change {
          user.connection_types.where(target_type: 'specific_type').count
        }.by(1)
      end
    end

    context 'specific_subtype' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          within '#specificTypeContainer' do # todo: test what happens if I don't select parent type (there was an issue in some template with this)
            choose_record_type('My Type')
          end
          within '#specificSubTypeContainer' do
            choose_record_type('My Type')
          end
          choose :connection_type_target_type_specific_subtype
          click_on 'Create!'
        }.to change {
          user.connection_types.where(target_type: 'specific_subtype').count
        }.by(1)
      end
    end
  end
end
