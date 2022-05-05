require 'rails_helper'

RSpec.feature "User Show Number of Projects", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, is_public: true }
  let!(:user2) { create :user, :confirmed, is_public: true }

  let!(:record1) { create :record, user: user1, separate_project: true }
  let!(:record2) { create :record, user: user1, separate_project: true }
  let!(:record3) { create :record, user: user1, separate_project: true }
  let!(:record4) { create :record, user: user2, separate_project: true }
  let!(:record5) { create :record, user: user2, separate_project: true }

  context 'user 1' do
    before { login_as user1 }

    scenario 'shows number of projects' do
      visit user_path(user1)
      expect(page).to have_content '3 Projects'
    end
  end

  context 'user 2' do
    before { login_as user2 }

    scenario 'shows number of projects' do
      visit user_path(user2)
      expect(page).to have_content '2 Projects'
    end
  end
end
