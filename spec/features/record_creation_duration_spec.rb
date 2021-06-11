require 'rails_helper'

RSpec.feature "New Record Duration", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:record_type) { create :record_type, name: "my type", user: user }

    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit new_record_path
    end

    it 'should let me create' do
      expect {
        select 'my type', from: :record_record_type_id
        fill_in :record_name, with: 'boo'
        fill_in :record_dots_attributes_0_duration, with: 12345
        click_on 'Create!'
      }.to change {
        user.records.joins(:dots).where(dots: { duration: 12345 } ).count
      }.by(1)
    end
  end
end
