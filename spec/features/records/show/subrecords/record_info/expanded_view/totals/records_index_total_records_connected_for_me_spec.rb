require 'rails_helper'

RSpec.feature "Record Created By", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  let!(:main_record1) { create :record, user: user1, is_public: true }
  let!(:main_record2) { create :record, user: user1, is_public: true }

  let!(:public_record) { create :record, user: user1, is_public: true }

  let!(:public_record1) { create :record, user: user1, is_public: true }
  let!(:public_record2) { create :record, user: user1, is_public: true }
  let!(:public_record3) { create :record, user: user2, is_public: true }
  let!(:public_record4) { create :record, user: user2, is_public: true }
  let!(:public_record5) { create :record, user: user2, is_public: true }

  let!(:connection1) { create :connection, record_a: public_record2, record_b: public_record }
  let!(:connection2) { create :connection, record_a: public_record1, record_b: public_record2 }
  let!(:connection3) { create :connection, record_a: public_record2, record_b: public_record3 }
  let!(:connection4) { create :connection, record_a: public_record4, record_b: public_record }
  let!(:connection5) { create :connection, record_a: public_record4, record_b: public_record5 }

  let!(:private_record6) { create :record, user: user2, is_public: false }
  let!(:private_record7) { create :record, user: user2, is_public: false }

  let!(:connection6) { create :connection, record_a: public_record5, record_b: private_record6 }
  let!(:connection7) { create :connection, record_a: public_record3, record_b: private_record7 }

  let!(:unconnected_public_record1) { create :record, user: user1, is_public: true }
  let!(:unconnected_public_record2) { create :record, user: user2, is_public: true }

  # not sure if I should or should not know that someone has a private record connected to my record
  let!(:connection1) { create :connection, record_a: main_record1, record_b: public_record1, user: user1 }
  let!(:connection2) { create :connection, record_a: main_record1, record_b: public_record2, user: user1 }
  let!(:connection3) { create :connection, record_a: main_record1, record_b: public_record3, user: user1 }
  let!(:connection4) { create :connection, record_a: main_record1, record_b: public_record4, user: user1 }
  let!(:connection5) { create :connection, record_a: main_record1, record_b: public_record5, user: user1 }

  context 'not signed in' do
    before { visit record_path(main_record1) }

    it { expect(page).to have_no_content 'My records in tree' }
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
    end

    context 'public' do
      before { visit record_path(main_record1) }

      it { expect(page).to have_content 'My records in tree: 5' }
    end

    context 'private' do
      before { visit record_path(main_record1) }
      it { expect(page).to have_no_content 'My records in tree: 7' }
    end
  end
end
