require 'rails_helper'

RSpec.feature "Record Created By", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  let!(:public_record) { create :record, user: user1, is_public: true }

  let!(:public_project1) { create :record, user: user1, is_public: true, separate_project: true }
  let!(:public_project2) { create :record, user: user1, is_public: true, separate_project: true }

  let!(:private_record) { create :record, user: user2, is_public: false }
  let!(:private_project1) { create :record, user: user2, is_public: false, separate_project: true }
  let!(:private_project2) { create :record, user: user2, is_public: false, separate_project: true }

  let!(:public_dot1) { create :dot, user: user1, project: public_project1, record: public_record }
  let!(:public_dot2) { create :dot, user: user1, project: public_project1, record: public_record }
  let!(:public_dot3) { create :dot, user: user1, project: public_project2, record: public_record }
  let!(:private_dot1) { create :dot, user: user2, project: private_project1, record: private_record }
  let!(:private_dot2) { create :dot, user: user2, project: private_project1, record: private_record }
  let!(:private_dot3) { create :dot, user: user2, project: private_project1, record: private_record }

  context 'not signed in' do
    context 'public record' do
      before { visit record_path(public_record) }

      it { expect(page).to have_no_content 'My projects affected' }
    end

    context 'private record' do
      before { visit record_path(public_record) }

      it { expect(page).to have_no_content 'My projects affected' }
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
    end

    context 'public_record' do
      before { visit record_path(public_record) }

      it { expect(page).to have_content 'My projects affected: 0' }
    end

    context 'private_record' do
      before { visit record_path(private_record) }

      it { expect(page).to have_content 'My projects affected: 1' }
    end
  end
end
