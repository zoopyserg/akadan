require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true }

  let!(:design2) { create :design, is_public: false, user: user2, designable: public_record1 }
  let!(:column) { create :column, design: design2, collapsed: false }

  context 'not signed in' do
    before do
      visit user_path(user1)
      click_on 'Add a Column'
      click_on 'Add a Basic Column'
      expect(current_path).to eq new_user_session_path
      visit user_path(user1)
    end

    it { expect(page).to have_css '.record_semicollapsed', count: 2 }
    it { expect(page).to have_no_css '.record_collapsed' }
  end

  context 'user1 signed in' do
    before { login_as user1 }

    before do
      visit user_path(user1)
      click_on 'Add a Column'
      click_on 'Add a Basic Column'
      visit user_path(user1)
    end

    it { expect(page).to have_css '.record_semicollapsed', count: 4 }
    it { expect(page).to have_no_css '.record_collapsed' }
  end

  context 'user2 signed in' do
    before { login_as user2 }

    before do
      visit user_path(user1)
      click_on 'Add a Column'
      click_on 'Add a Basic Column'
      visit user_path(user1)
    end

    it { expect(page).to have_css '.record_semicollapsed', count: 4 }
    it { expect(page).to have_no_css '.record_collapsed' }
  end
end
