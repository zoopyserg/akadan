require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true }
  let!(:public_record3) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true }

  let!(:connection1) { create :connection, record_b: public_record2, record_a: public_record1 }
  let!(:connection2) { create :connection, record_b: public_record3, record_a: public_record1 }

  let!(:design2) { create :design, is_public: false, user: user2, designable: public_record1 }
  let!(:column) { create :column, design: design2, collapsed: false }

  context 'not signed in' do
    before do
      visit record_path(public_record1)
      click_on 'Add a Column'
      click_on 'Add a Basic Column'
      expect(current_path).to eq new_user_session_path
      visit record_path(public_record1)
    end

    it { expect(page).to have_css '.record_collapsed', count: 2 }
    it { expect(page).to have_no_css '.record_semicollapsed' }
  end

  context 'user1 signed in' do
    before { login_as user1 }

    before do
      visit record_path(public_record1)
      click_on 'Add a Column'
      click_on 'Add a Basic Column'
      visit record_path(public_record1)
    end

    it { expect(page).to have_css '.record_semicollapsed', count: 2 }
    it { expect(page).to have_css '.record_collapsed', count: 2 }
  end

  context 'user2 signed in' do
    before { login_as user2 }

    before do
      visit record_path(public_record1)
      click_on 'Add a Column'
      click_on 'Add a Basic Column'
      visit record_path(public_record1)
    end

    it { expect(page).to have_css '.record_semicollapsed', count: 4 }
    it { expect(page).to have_css '.record_collapsed', count: 2 }
  end
end
