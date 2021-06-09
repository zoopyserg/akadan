require 'rails_helper'

RSpec.feature "ConnectionTypeCreation One To How Many", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit new_connection_type_path
    end

    context 'true' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_one_to_many_true
          click_on 'Create!'
        }.to change {
          user.connection_types.where(one_to_many: true).count
        }.by(1)
      end
    end

    context 'false' do
      it 'should let me create' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_one_to_many_false
          click_on 'Create!'
        }.to change {
          user.connection_types.where(one_to_many: false).count
        }.by(1)
      end
    end
  end
end
