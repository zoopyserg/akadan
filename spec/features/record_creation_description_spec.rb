require 'rails_helper'

RSpec.feature "New Record Description", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit new_record_path
    end

    it 'should let me create' do
      expect {
        fill_in :record_name, with: 'boo'
        fill_in :record_description, with: 'boo'
        click_on 'Create!'
      }.to change {
        user.records.where(description: 'boo').count
      }.by(1)
    end
  end
end
