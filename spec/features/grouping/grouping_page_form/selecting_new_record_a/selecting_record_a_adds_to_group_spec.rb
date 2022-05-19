require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user) { create :user, :confirmed }
  let!(:record_type1) { create :record_type, name: 'Old Record Type', is_public: true }
  let!(:record_type2) { create :record_type, name: 'The Magic Record Type', is_public: true }
  let!(:record0) { create :record, :with_dot, name: 'Public Record 0', user: user, record_type: record_type1, is_public: true }
  let!(:record1) { create :record, :with_dot, name: 'Public Record 1', user: user, record_type: record_type1, is_public: true }
  let!(:record2) { create :record, :with_dot, name: 'Public Record 2', user: user, record_type: record_type1, is_public: true }
  let!(:record3) { create :record, :with_dot, name: 'Public Record 3', user: user, record_type: record_type1, is_public: false }

  let!(:record4) { create :record, :with_dot, name: 'Some Magic Record', is_public: true }

  let!(:connection_type) { create :connection_type, is_public: true }

  let!(:group) { create :group, user: user, connection_type: connection_type, record_b: record1 }
  let!(:affiliation1) { create :affiliation, group: group, record_a: record2 }
  let!(:affiliation2) { create :affiliation, group: group, record_a: record3 }

  before { login_as user }
  before { visit edit_group_path(group) }

  it do
    choose_something('Some Magic Record', '.add_existing_record_a_selection_section')
    click_on 'Add Record A'

    expect(Affiliation.joins(:group).where(record_a: record4, group: { record_b: record1}).count).to eq 1
  end
end
