require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:record_type) { create :record_type, user: user1, name: 'Magic Type', is_public: true }

  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true, record_type: record_type }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user2, is_public: true }

  let!(:design1) { create :design, user: user1, is_public: false, designable: nil }
  let!(:design2) { create :design, user: user2, is_public: false, designable: nil }

  context 'not signed in' do
    before do
      visit records_path
      expect(page).to have_content 'Public Record 1'
      expect(page).to have_content 'Public Record 2'
      choose_something('Magic Type', '.column_record_type:nth-of-type(1)')
      click_on 'Update Column Filters'
      expect(current_path).to eq records_path
    end

    it { expect(page).to have_content 'Public Record 1' }
    it { expect(page).to have_no_content 'Public Record 2' }
  end

  context 'user1 signed in' do
    before { login_as user1 }
    before do
      visit records_path
      expect(page).to have_content 'Public Record 1'
      expect(page).to have_content 'Public Record 2'
      choose_something('Magic Type', '.column_record_type:nth-of-type(1)')
      click_on 'Update Column Filters'
      expect(current_path).to eq records_path
    end

    it { expect(page).to have_content 'Public Record 1' }
    it { expect(page).to have_no_content 'Public Record 2' }
  end

  context 'user2 signed in' do
    before { login_as user2 }
    before do
      visit records_path
      expect(page).to have_content 'Public Record 1'
      expect(page).to have_content 'Public Record 2'
      choose_something('Magic Type', '.column_record_type:nth-of-type(1)')
      click_on 'Update Column Filters'
      expect(current_path).to eq records_path
      logout
      visit records_path
    end

    it { expect(page).to have_content 'Public Record 1' }
    it { expect(page).to have_content 'Public Record 2' }
  end
end
