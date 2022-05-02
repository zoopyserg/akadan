require 'rails_helper'

RSpec.feature "Index People Pagination", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', first_name: 'Jack', last_name: 'Daniels', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  before do
    User.where.not(id: user.id).destroy_all
    120.times do |time|
      create :user, :free, :confirmed
    end
  end

  context 'not signed in' do
    before { visit people_path }

    it 'should show the number' do
      expect(page).to have_content 'People (121)' # +1 because it does not show me in the list when I am signed in
    end
  end

  context 'signed in' do
    before do
      login_as user
      visit people_path
    end

    it 'should show the number' do
      expect(page).to have_content 'People (120)'
    end
  end
end
