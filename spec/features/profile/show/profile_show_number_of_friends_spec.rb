require 'rails_helper'

RSpec.feature "User Show Number of Projects", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, is_public: true }
  let!(:user2) { create :user, :confirmed, is_public: true }
  let!(:user3) { create :user, :confirmed, is_public: true }
  let!(:user4) { create :user, :confirmed, is_public: true }
  let!(:user5) { create :user, :confirmed, is_public: true }

  let!(:friend_request) { create :friend_request, user: user1, friend: user3 }
  let!(:friend_request2) { create :friend_request, user: user3, friend: user1 }

  let!(:friend_request3) { create :friend_request, user: user1, friend: user4 }
  let!(:friend_request4) { create :friend_request, user: user4, friend: user1 }

  let!(:friend_request6) { create :friend_request, user: user2, friend: user4 }
  let!(:friend_request7) { create :friend_request, user: user4, friend: user2 }

  let!(:friend_request8) { create :friend_request, user: user2, friend: user5 }

  context 'user 1' do
    before { login_as user1 }

    scenario 'shows number of projects' do
      visit user_path(user1)
      expect(page).to have_content '2 Friends'
    end
  end

  context 'user 2' do
    before { login_as user2 }

    scenario 'shows number of projects' do
      visit user_path(user2)
      expect(page).to have_content '1 Friends'
    end
  end
end
