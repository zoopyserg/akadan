require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true }
  let!(:public_record3) { create :record, :with_dot, name: 'Public Record 2', user: user1, is_public: true }

  let!(:connection1) { create :connection, record_b: public_record2, record_a: public_record1 }
  let!(:connection2) { create :connection, record_b: public_record3, record_a: public_record1 }

  let!(:design1) { create :design, user: user1, designable: nil, is_public: false }

  let!(:column1) { create :column, design: design1 }

  let!(:collapsed_column_params) { [ { collapsed: true } ] }
  let!(:uncollapsed_column_params) { [ { collapsed: false } ] }

  context 'collapsed' do
    before { visit record_path(public_record1, columns: collapsed_column_params) }

    it { expect(page).to have_css '.record_collapsed', count: 2 }
    it { expect(page).to have_no_css '.record_semicollapsed' }
  end

  context 'uncollapsed' do
    before { visit record_path(public_record1, columns: uncollapsed_column_params) }

    it { expect(page).to have_css '.record_semicollapsed', count: 2 }
    it { expect(page).to have_no_css '.record_collapsed' }
  end
end
