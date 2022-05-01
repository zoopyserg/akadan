require 'rails_helper'

RSpec.feature "New Record Duration", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  context 'signed in' do
    let!(:user) { create :user }
    let!(:record_type) { create :record_type, name: "my type", user: user }

    before do
      login_as user, scope: :user
      visit new_record_path
    end

    it 'should let me create' do
      expect {
        choose_record_type('my type')
        fill_in :record_name, with: 'boo'
        fill_in :record_dots_attributes_0_duration, with: 12345
        click_on 'Create!'
      }.to change {
        user.records.joins(:dots).where(dots: { duration: 12345 } ).count
      }.by(1)
    end
  end
end
