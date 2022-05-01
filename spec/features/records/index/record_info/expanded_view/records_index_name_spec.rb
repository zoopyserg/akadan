require 'rails_helper'

RSpec.feature "Record Name", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_record) { create :record, :with_dot, name: 'Public Name', user: user1, is_public: true }
  let!(:private_record) { create :record, :with_dot, name: 'Private Name', user: user2, is_public: false }

  context 'not signed in' do
    before { visit records_path }

    it 'should say who created one record' do
      expect(page).to have_content 'Public Name'
    end

    it 'should not say names of people who do not have public connections' do
      expect(page).to have_no_content 'Private Name'
    end
  end

  context 'signed in' do
    before do
      login_as user2
      visit records_path
    end

    it 'should say who created public record' do
      expect(page).to have_content 'Public Name'
    end

    it 'should say I created a private record' do
      expect(page).to have_content 'Private Name'
    end
  end
end
