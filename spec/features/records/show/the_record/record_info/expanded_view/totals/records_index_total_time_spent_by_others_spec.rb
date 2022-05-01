require 'rails_helper'

RSpec.feature "Record Created By", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_record) { create :record, user: user1, is_public: true }
  let!(:private_record) { create :record, user: user2, is_public: false }
  let!(:public_dot1) { create :dot, user: user1, duration: 11, project: public_record, record: public_record }
  let!(:public_dot2) { create :dot, user: user1, duration: 11, project: public_record, record: public_record }
  let!(:public_dot3) { create :dot, user: user2, duration: 11, project: public_record, record: public_record }
  let!(:private_dot1) { create :dot, user: user2, duration: 33, project: private_record, record: private_record }
  let!(:private_dot2) { create :dot, user: user2, duration: 33, project: private_record, record: private_record }
  let!(:private_dot3) { create :dot, user: user1, duration: 33, project: private_record, record: private_record }

  context 'not signed in' do
    before { visit record_path(public_record) }

    it { expect(page).to have_no_content 'time spent by others: 11' }
    it { expect(page).to have_no_content 'time spent by others: 22' }
    it { expect(page).to have_no_content 'time spent by others: 33' }
    it { expect(page).to have_no_content 'time spent by others: 66' }
    it { expect(page).to have_no_content 'time spent by others: 99' }
  end

  context 'signed in' do
    before do
      login_as user2
    end

    context 'public' do
      before { visit record_path(public_record) }
      it { expect(page).to have_content 'time spent by others: 22' }
      it { expect(page).to have_no_content 'time spent by others: 11' }
    end

    context 'private' do
      before { visit record_path(private_record) }
      it { expect(page).to have_content 'time spent by others: 33' }
      it { expect(page).to have_no_content 'time spent by others: 66' }
      it { expect(page).to have_no_content 'time spent by others: 99' }
    end
  end
end
