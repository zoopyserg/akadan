require 'rails_helper'

RSpec.feature "RecordCreation Cancel", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free }

    before do
      login_as user, scope: :user
      visit new_record_path
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
      expect(current_path).to eq records_path
    end
  end
end
