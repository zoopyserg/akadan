require 'rails_helper'

RSpec.feature "RecordCreations", type: :feature do
  context 'not signed in' do
    it 'should redirect to sign in page' do
      visit new_record_path

      expect(current_path).to eq new_user_session_path
    end
  end

  xcontext 'signed in' do
    let!(:user) { create :user }
    let!(:record_type) { create :record_type, name: "my type", user: user }

    before do
      login_as user, scope: :user
      visit new_record_path
    end

    it 'should let me create sensors ?' do

    end
  end
end
