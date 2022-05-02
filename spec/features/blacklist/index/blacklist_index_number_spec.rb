require 'rails_helper'

RSpec.feature "Index Blacklist Pagination", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  before do
    User.where.not(id: user.id).destroy_all

    120.times do |time|
      blocked_user = create :user, :confirmed, :free, username: "blocked_user_#{time}"
      create :blocking, user: user, blocked_user: blocked_user
    end
  end

  context 'not signed in' do
    before { visit blocked_users_path }

    it { expect(current_path).to eq new_user_session_path }
  end

  context 'signed in' do
    before do
      login_as user
      visit blocked_users_path
    end

    it 'should show a number' do
      expect(page).to have_content 'Blocked Users (120)'
    end
  end
end


