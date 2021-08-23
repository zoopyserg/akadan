require 'rails_helper'

RSpec.feature "Record Name", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  let!(:main_record1) { create :record, user: user1, is_public: true }
  let!(:main_record2) { create :record, user: user1, is_public: true }

  let!(:public_record) { create :record, name: 'Public Name', user: user1, is_public: true }
  let!(:public_record_invisible) { create :record, name: 'Public Name Invisible', user: user1, is_public: true }

  let!(:private_record) { create :record, name: 'Private Name', user: user2, is_public: false }
  let!(:private_record_invisible) { create :record, name: 'Private Name Invisible', user: user2, is_public: false }

  let!(:connection1) { create :connection, record_a: main_record1, record_b: public_record, user: user1 }
  let!(:connection2) { create :connection, record_a: main_record1, record_b: private_record, user: user1 }

  let!(:connection3) { create :connection, record_a: main_record2, record_b: public_record_invisible, user: user1 }
  let!(:connection4) { create :connection, record_a: main_record2, record_b: private_record_invisible, user: user1 }

  context 'not signed in' do
    before { visit record_path(main_record1) }

    it 'should say who created one record' do
      expect(page).to have_content 'Public Name'
    end

    it 'should not say names of people who do not have public connections' do
      expect(page).to have_no_content 'Private Name'
    end

    it 'should not show invisible records' do
      expect(page).to have_no_content 'Public Name Invisible'
    end

    it 'should not show invisible records' do
      expect(page).to have_no_content 'Private Name Invisible'
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit record_path(main_record1)
    end

    it 'should say who created public record' do
      expect(page).to have_content 'Public Name'
    end

    it 'should say I created a private record' do
      expect(page).to have_content 'Private Name'
    end

    it 'should not show invisible records' do
      expect(page).to have_no_content 'Public Name Invisible'
    end

    it 'should not show invisible records' do
      expect(page).to have_no_content 'Private Name Invisible'
    end
  end
end
