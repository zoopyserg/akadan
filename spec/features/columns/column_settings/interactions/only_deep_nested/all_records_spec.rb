require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }

  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true, separate_project: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user2, is_public: true, separate_project: false }

  let!(:design1) { create :design, user: user1, is_public: false, designable: nil }
  let!(:design2) { create :design, user: user2, is_public: false, designable: nil }

  context 'not signed in' do
    before do
      visit records_path
    end

    it { expect(page).to have_no_css '#desire_design_attributes_columns_attributes_0_only_direct_children_true' }
    it { expect(page).to have_no_css '#desire_design_attributes_columns_attributes_0_only_direct_children_false' }
  end

  context 'user1 signed in' do
    before { login_as user1 }
    before do
      visit records_path
    end

    it { expect(page).to have_no_css '#desire_design_attributes_columns_attributes_0_only_direct_children_true' }
    it { expect(page).to have_no_css '#desire_design_attributes_columns_attributes_0_only_direct_children_false' }
  end

  context 'user2 signed in' do
    before { login_as user2 }

    before do
      visit records_path
    end

    it { expect(page).to have_no_css '#desire_design_attributes_columns_attributes_0_only_direct_children_true' }
    it { expect(page).to have_no_css '#desire_design_attributes_columns_attributes_0_only_direct_children_false' }
  end
end
