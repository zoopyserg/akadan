require 'rails_helper'

RSpec.feature "Index Friends Pagination", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  before do
    User.where.not(id: user.id).destroy_all

    120.times do |time|
      friend = create :user, :confirmed, :free, username: "friend#{time}"
      create :friend_request, user: user, friend: friend
      create :friend_request, friend: user, user: friend
    end
  end

  context 'not signed in' do
    before { visit friends_path }

    it { expect(current_path).to eq new_user_session_path }
  end

  context 'signed in' do
    before do
      login_as user
      visit friends_path
    end

    it 'should show the number' do
      expect(page).to have_content 'Friends (120)'
    end
  end
end
