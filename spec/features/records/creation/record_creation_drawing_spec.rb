require 'rails_helper'

RSpec.feature "New Record Drawing", type: :feature do
  context 'not signed in' do
    # skipping because it's tested in New Permissions
  end

  context 'signed in' do
    let!(:user) { create :user }

    before do
      login_as user, scope: :user
      visit new_record_path
    end

    it 'should let me draw (not sure for now)' do

    end
  end
end
