require 'rails_helper'

RSpec.feature "New Record File Upload", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  xcontext 'signed in' do
    let!(:user) { create :user }

    before do
      login_as user, scope: :user
      visit new_record_path
    end

    it 'should let me create' do
      expect {
        choose_record_type("my type")
        fill_in :record_name, with: 'boo'
        fill_in :record_description, with: 'boo'
        click_on 'Create!'
      }.to change {
        user.records.where(description: 'boo').count
      }.by(1)
    end
  end
end
