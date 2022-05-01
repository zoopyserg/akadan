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

  context 'not signed in' do

    context 'public record' do
      before { visit record_path(public_record) }

      it { expect(page).to have_content '2 times' }
      it { expect(page).to have_no_content '3 times' }
    end

    context 'private record' do
      before { visit record_path(private_record) }

      it { expect(page).to have_no_content '2 times' }
      it { expect(page).to have_no_content '3 times' }
    end
  end

  context 'signed in' do
    before do
      login_as user2
    end

    context 'public record' do
      before { visit record_path(public_record) }

      it { expect(page).to have_content '2 times' }
    end

    context 'private record' do
      before { visit record_path(private_record) }

      it { expect(page).to have_content '3 times' }
    end
  end
end
