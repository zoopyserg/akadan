require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user) { create :user, :confirmed }
  let!(:record1) { create :record, :with_dot, name: 'Public Record 1', user: user, is_public: true }
  let!(:record2) { create :record, :with_dot, name: 'Public Record 2', user: user, is_public: true }
  let!(:record3) { create :record, :with_dot, name: 'Public Record 3', user: user, is_public: false }

  let!(:connection_type) { create :connection_type }

  let!(:group) { create :group, user: user, connection_type: connection_type, record_b: record1 }
  let!(:affiliation1) { create :affiliation, group: group, record_a: record2 }
  let!(:affiliation2) { create :affiliation, group: group, record_a: record3 }

  before { login_as user }
  before { visit edit_group_path(group) }

  it { expect(page).to have_css "#group_record_a_ids_#{record2.id}:checked" }
  it { expect(page).to have_css "#group_record_a_ids_#{record3.id}:checked" }
end
