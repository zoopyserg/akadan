require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:record) { create :record, user: user1, is_public: true, name: 'Main Record' }
  let!(:record2) { create :record, user: user1, is_public: true, name: 'Main Record' }

  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user2, is_public: true }
  let!(:private_record1) { create :record, :with_dot, name: 'Private Record 1', user: user1, is_public: false }
  let!(:private_record2) { create :record, :with_dot, name: 'Private Record 2', user: user2, is_public: false }

  let!(:connection1) { create :connection, record_a: record, record_b: public_record1 }
  let!(:connection2) { create :connection, record_a: record, record_b: public_record2 }
  let!(:connection3) { create :connection, record_a: record, record_b: private_record1 }
  let!(:connection4) { create :connection, record_a: record, record_b: private_record2 }

  let!(:invisible_public_record1) { create :record, :with_dot, name: 'Public Invisible Record 1', user: user1, is_public: true }
  let!(:invisible_public_record2) { create :record, :with_dot, name: 'Public Invisible Record 2', user: user2, is_public: true }
  let!(:invisible_private_record1) { create :record, :with_dot, name: 'Private Invisible Record 1', user: user1, is_public: false }
  let!(:invisible_private_record2) { create :record, :with_dot, name: 'Private Invisible Record 2', user: user2, is_public: false }

  let!(:invisible_connection1) { create :connection, record_a: record2, record_b: public_record1 }
  let!(:invisible_connection2) { create :connection, record_a: record2, record_b: public_record2 }
  let!(:invisible_connection3) { create :connection, record_a: record2, record_b: private_record1 }
  let!(:invisible_connection4) { create :connection, record_a: record2, record_b: private_record2 }

  context 'not signed in' do
    before { visit record_path(record) }

    it { expect(current_path).to eq record_path(record) }
    it { expect(page).to have_content 'Public Record 1' }
    it { expect(page).to have_content 'Public Record 2' }
    it { expect(page).to have_no_content 'Private Record 1' }
    it { expect(page).to have_no_content 'Private Record 2' }

    it { expect(page).to have_no_content 'Public Invisible Record 1' }
    it { expect(page).to have_no_content 'Public Invisible Record 2' }
    it { expect(page).to have_no_content 'Private Invisible Record 1' }
    it { expect(page).to have_no_content 'Private Invisible Record 2' }
  end

  context 'signed in user 1' do
    before { login_as user1 }
    before { visit record_path(record) }

    it { expect(current_path).to eq record_path(record) }
    it { expect(page).to have_content 'Public Record 1' }
    it { expect(page).to have_content 'Public Record 2' }
    it { expect(page).to have_content 'Private Record 1' }
    it { expect(page).to have_no_content 'Private Record 2' }

    it { expect(page).to have_no_content 'Public Invisible Record 1' }
    it { expect(page).to have_no_content 'Public Invisible Record 2' }
    it { expect(page).to have_no_content 'Private Invisible Record 1' }
    it { expect(page).to have_no_content 'Private Invisible Record 2' }
  end

  context 'signed in user 2' do
    before { login_as user2 }
    before { visit record_path(record) }

    it { expect(current_path).to eq record_path(record) }
    it { expect(page).to have_content 'Public Record 1' }
    it { expect(page).to have_content 'Public Record 2' }
    it { expect(page).to have_no_content 'Private Record 1' }
    it { expect(page).to have_content 'Private Record 2' }

    it { expect(page).to have_no_content 'Public Invisible Record 1' }
    it { expect(page).to have_no_content 'Public Invisible Record 2' }
    it { expect(page).to have_no_content 'Private Invisible Record 1' }
    it { expect(page).to have_no_content 'Private Invisible Record 2' }
  end
end
