require 'rails_helper'

RSpec.feature "ConnectionType Cancel", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

    before do
      login_as user
      visit new_connection_type_path
    end

    it 'should let me create' do
      expect {
        click_on 'Cancel'
      }.to change {
        user.records.count
      }.by(0)
    end

    it 'should redirect to records index' do
      click_on 'Cancel'
      expect(current_path).to eq connection_types_path
    end
  end
end
