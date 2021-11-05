require 'rails_helper'

RSpec.feature "Record Created By", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  let!(:main_record1) { create :record, user: user1, is_public: true }
  let!(:main_record2) { create :record, user: user1, is_public: true }

  let!(:public_record) { create :record, user: user1, is_public: true, separate_project: true }
  let!(:public_record_invisible) { create :record, name: 'Public Name Invisible', user: user1, is_public: true }

  let!(:private_record) { create :record, user: user2, is_public: false, separate_project: true }
  let!(:private_record_invisible) { create :record, name: 'Private Name Invisible', user: user2, is_public: false }

  let!(:connection1) { create :connection, record_a: main_record1, record_b: public_record, user: user1 }
  let!(:connection2) { create :connection, record_a: main_record1, record_b: private_record, user: user1 }

  let!(:connection3) { create :connection, record_a: main_record2, record_b: public_record_invisible, user: user1 }
  let!(:connection4) { create :connection, record_a: main_record2, record_b: private_record_invisible, user: user1 }

  let!(:public_dot) { create :dot, user: user1, record: public_record, project: public_record, description: 'Public Description' }
  let!(:private_dot) { create :dot, user: user2, record: private_record, project: private_record, description: 'Private Description' }

  let!(:public_dot_invisible) { create :dot, user: user1, record: public_record_invisible, project: public_record_invisible, description: 'Public Description Invisible' }
  let!(:private_dot_invisible) { create :dot, user: user2, record: private_record_invisible, project: private_record_invisible, description: 'Private Description Invisible' }

  context 'not signed in' do
    before { visit record_path(main_record1) }

    it 'should say who created one record' do
      expect(page).to have_content 'Public Description'
    end

    it 'should not say names of people who do not have public connections' do
      expect(page).to have_no_content 'Private Description'
    end

    it 'should not show invisible records' do
      expect(page).to have_no_content 'Public Description Invisible'
    end

    it 'should not show invisible records' do
      expect(page).to have_no_content 'Private Description Invisible'
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit record_path(main_record1)
    end

    it 'should say who created public record' do
      expect(page).to have_content 'Public Description'
    end

    it 'should say I created a private record' do
      expect(page).to have_content 'Private Description'
    end

    it 'should not show invisible records' do
      expect(page).to have_no_content 'Public Description Invisible'
    end

    it 'should not show invisible records' do
      expect(page).to have_no_content 'Private Description Invisible'
    end
  end
end
