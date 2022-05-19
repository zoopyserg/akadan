require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user) { create :user, :confirmed }
  let!(:record1) { create :record, :with_dot, name: 'Public Record 1', user: user, is_public: true }
  let!(:record2) { create :record, :with_dot, name: 'Public Record 2', user: user, is_public: true }
  let!(:record3) { create :record, :with_dot, name: 'Public Record 3', user: user, is_public: false }

  let!(:connection_type1) { create :connection_type, name: 'Connection Type 1', is_public: true }
  let!(:connection_type2) { create :connection_type, name: 'Connection Type 2', is_public: true }

  let!(:group) { create :group, user: user, connection_type: connection_type2, record_b: record1 }

  let!(:affiliation1) { create :affiliation, group: group, record_a: record2 }
  let!(:affiliation2) { create :affiliation, group: group, record_a: record3 }

  before { login_as user }
  before { visit edit_group_path(group) }

  it do
    expect(Connection.where(connection_type: connection_type1).count).to eq 0
    expect(Connection.where(connection_type: connection_type2).count).to eq 2

    choose_something('Connection Type 1', '.connection_type_selection_section')
    click_on 'Save Everything'

    expect(Connection.where(connection_type: connection_type1).count).to eq 2
    expect(Connection.where(connection_type: connection_type2).count).to eq 0
  end
end
