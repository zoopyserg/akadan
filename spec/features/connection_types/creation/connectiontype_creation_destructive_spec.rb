require 'rails_helper'

RSpec.feature "ConnectionTypeCreation Destructive", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

    before do
      login_as user
      visit new_connection_type_path
    end

    context 'true' do
      it 'should let me create true' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_destructive_true
          click_on 'Create!'
        }.to change {
          user.connection_types.where(destructive: true).count
        }.by(1)
      end
    end

    context 'false' do
      it 'should let me create false' do
        expect {
          fill_in :connection_type_name, with: 'boo'
          choose :connection_type_destructive_false
          click_on 'Create!'
        }.to change {
          user.connection_types.where(destructive: false).count
        }.by(1)
      end
    end
  end
end
