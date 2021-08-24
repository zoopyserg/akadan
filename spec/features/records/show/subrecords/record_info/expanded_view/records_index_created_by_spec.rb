require 'rails_helper'

RSpec.feature "Record Created By", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  let!(:main_record1) { create :record, user: user1, is_public: true }
  let!(:main_record2) { create :record, user: user1, is_public: true }

  let!(:public_record) { create :record, user: user1, is_public: true }
  let!(:public_record_invisible) { create :record, name: 'Public Name Invisible', user: user1, is_public: true }

  let!(:private_record) { create :record, user: user2, is_public: false }
  let!(:private_record_invisible) { create :record, name: 'Private Name Invisible', user: user2, is_public: false }

  let!(:connection1) { create :connection, record_a: main_record1, record_b: public_record, user: user1 }
  let!(:connection2) { create :connection, record_a: main_record1, record_b: private_record, user: user1 }

  let!(:connection3) { create :connection, record_a: main_record2, record_b: public_record_invisible, user: user1 }
  let!(:connection4) { create :connection, record_a: main_record2, record_b: private_record_invisible, user: user1 }


  context 'not signed in' do
    before { visit record_path(main_record1) }

    it 'should say who created one record' do
      within '.recordscolumn' do
        expect(page).to have_content 'John Smith'
        click_on 'John Smith'
        expect(current_path).to eq user_path(user1)
      end
    end

    it 'should not say names of people who do not have public connections' do
      within '.recordscolumn' do
        expect(page).to have_no_content 'Bob Smith'
      end
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit record_path(main_record1)
    end

    it 'should say who created public record' do
      within '.recordscolumn' do
        expect(page).to have_content 'John Smith'
        click_on 'John Smith'
        expect(current_path).to eq user_path(user1)
      end
    end

    it 'should say I created a private record' do
      within '.recordscolumn' do
        expect(page).to have_content 'Bob Smith'
        click_on 'Bob Smith'
        expect(current_path).to eq user_path(user2)
      end
    end
  end
end
