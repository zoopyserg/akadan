require 'rails_helper'

RSpec.feature "RecordCreations", type: :feature do
  context 'not signed in' do
    it 'should redirect to sign in page' do
      visit new_record_path

      expect(current_path).to eq new_user_session_path
    end
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:record_type) { create :record_type, name: "my type", user: user }

    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit new_record_path

      expect(page).to have_no_content 'successfully created'

      select 'my type', from: :record_record_type_id
      fill_in :record_name, with: 'some record'
      fill_in :record_description, with: 'some record'
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
