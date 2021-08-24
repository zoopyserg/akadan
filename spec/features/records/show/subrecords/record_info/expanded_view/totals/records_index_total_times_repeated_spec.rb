require 'rails_helper'

RSpec.feature "Record Created By", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_record) { create :record, user: user1, is_public: true }
  let!(:private_record) { create :record, user: user2, is_public: false }
  let!(:public_dot1) { create :dot, user: user1, duration: 11, project: public_record, record: public_record }
  let!(:public_dot2) { create :dot, user: user1, duration: 11, project: public_record, record: public_record }
  let!(:private_dot1) { create :dot, user: user2, duration: 33, project: private_record, record: private_record }
  let!(:private_dot2) { create :dot, user: user2, duration: 33, project: private_record, record: private_record }
  let!(:private_dot3) { create :dot, user: user2, duration: 33, project: private_record, record: private_record }

  let!(:main_record1) { create :record, user: user1, is_public: true }
  let!(:connection1) { create :connection, record_a: main_record1, record_b: public_record, user: user1 }
  let!(:connection2) { create :connection, record_a: main_record1, record_b: private_record, user: user1 }

  context 'not signed in' do
    before { visit record_path(main_record1) }

    it { expect(page).to have_content '2 times' }
    it { expect(page).to have_no_content '3 times' }
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit record_path(main_record1)
    end

    it { expect(page).to have_content '2 times' }
    it { expect(page).to have_content '3 times' }
  end
end
