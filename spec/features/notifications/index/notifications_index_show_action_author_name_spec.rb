require 'rails_helper'

RSpec.feature "Notifications Index Name", type: :feature do
  # note: it is probably just like a message - one notification, multiple readings etc
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_connection_type) { create :connection_type, name: 'Public Name', user: user1, is_public: true }
  let!(:private_connection) { create :connection_type, name: 'Private Name', user: user2, is_public: false }

  xcontext 'not signed in' do
    before { visit notifications_path }

    it 'should say who created one record' do
      expect(page).to have_content 'Public Name'
    end

    it 'should not say names of people who do not have public connections' do
      expect(page).to have_no_content 'Private Name'
    end
  end

  xcontext 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit notifications_path
    end

    it 'should say who created public record' do
      expect(page).to have_content 'Public Name'
    end

    it 'should say I created a private record' do
      expect(page).to have_content 'Private Name'
    end
  end
end
