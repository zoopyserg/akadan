require 'rails_helper'

RSpec.feature "RecordCreations", type: :feature do
  context 'not signed in' do
    it 'should redirect to sign in page' do
      visit new_record_path

      expect(current_path).to eq new_user_session_path
    end
  end

  context 'signed in' do
    let!(:user) { create :user }
    let!(:record_type) { create :record_type, name: "my type", user: user }

    before do
      login_as user, scope: :user
      visit new_record_path

      expect(page).to have_no_content 'successfully created'

      choose_record_type('my type')
      fill_in :record_name, with: 'some record'
      fill_in 'Description', with: 'some record'
    end

    it 'should let me create' do
      click_on 'Create!'

      expect(page).to have_content 'successfully created'
    end

    it 'should create a separate project' do
      expect{
      click_on 'Create!'
      }.to change {
        user.records.where(separate_project: true).count
      }.by(1)
    end
  end
end
