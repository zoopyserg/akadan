require 'rails_helper'

RSpec.feature "ConnectionsIndex Description", type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_connection) { create :connection, description: 'Public Description', user: user1, is_public: true }
  let!(:private_connection) { create :connection, description: 'Private Description', user: user2, is_public: false }

  context 'not signed in' do
    before { visit connections_path }

    it 'should say who created one record' do
      expect(page).to have_content 'Public Description'
    end

    it 'should not say names of people who do not have public connections' do
      expect(page).to have_no_content 'Private Description'
    end
  end

  context 'signed in' do
    before do
      login_as user2
      visit connections_path
    end

    it 'should say who created public record' do
      expect(page).to have_content 'Public Description'
    end

    it 'should say I created a private record' do
      expect(page).to have_content 'Private Description'
    end
  end
end
