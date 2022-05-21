require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true }

  let!(:design1) { create :design, user: user1, designable: nil, is_public: false }

  let!(:column1) { create :column, design: design1 }

  let!(:collapsed_column_params) { [ { collapsed: true } ] }
  let!(:uncollapsed_column_params) { [ { collapsed: false } ] }

  context 'collapsed' do
    before { visit user_path(user1, columns: collapsed_column_params) }

    it { expect(page).to have_css '.record_collapsed', count: 2 }
    it { expect(page).to have_no_css '.record_semicollapsed' }
  end

  context 'uncollapsed' do
    before { visit user_path(user1, columns: uncollapsed_column_params) }

    it { expect(page).to have_css '.record_semicollapsed', count: 2 }
    it { expect(page).to have_no_css '.record_collapsed' }
  end
end
