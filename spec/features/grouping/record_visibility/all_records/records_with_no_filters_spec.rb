require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user2, is_public: true }
  let!(:private_record1) { create :record, :with_dot, name: 'Private Record 1', user: user1, is_public: false }
  let!(:private_record2) { create :record, :with_dot, name: 'Private Record 2', user: user2, is_public: false }

  context 'not signed in' do
    before { visit records_path }

    it { expect(current_path).to eq records_path }
    it { expect(page).to have_content 'Public Record 1' }
    it { expect(page).to have_content 'Public Record 2' }
    it { expect(page).to have_no_content 'Private Record 1' }
    it { expect(page).to have_no_content 'Private Record 2' }
  end

  context 'signed in user 1' do
    before { login_as user1 }
    before { visit records_path }

    it { expect(current_path).to eq records_path }
    it { expect(page).to have_content 'Public Record 1' }
    it { expect(page).to have_content 'Public Record 2' }
    it { expect(page).to have_content 'Private Record 1' }
    it { expect(page).to have_no_content 'Private Record 2' }
  end

  context 'signed in user 2' do
    before { login_as user2 }
    before { visit records_path }

    it { expect(current_path).to eq records_path }
    it { expect(page).to have_content 'Public Record 1' }
    it { expect(page).to have_content 'Public Record 2' }
    it { expect(page).to have_no_content 'Private Record 1' }
    it { expect(page).to have_content 'Private Record 2' }
  end
end
