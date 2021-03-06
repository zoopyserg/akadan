require 'rails_helper'

RSpec.feature "ConnectionsIndex Created By", type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_record_type) { create :record_type, description: 'Public Description', user: user1, is_public: true }
  let!(:private_record_type) { create :record_type, description: 'Private Description', user: user2, is_public: false }

  context 'not signed in' do
    before { visit record_types_path }

    it 'should say who created one record' do
      expect(page).to have_content 'Public Description'
    end

    it 'should not say names of people who do not have public record_types' do
      expect(page).to have_no_content 'Private Description'
    end
  end

  context 'signed in' do
    before do
      login_as user2
      visit record_types_path
    end

    it 'should say who created public record' do
      expect(page).to have_content 'Public Description'
    end

    it 'should say I created a private record' do
      expect(page).to have_content 'Private Description'
    end
  end
end
