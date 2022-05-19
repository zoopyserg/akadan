require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user) { create :user, :confirmed }
  let!(:record1) { create :record, :with_dot, name: 'Public Record 1', user: user, is_public: true }
  let!(:record2) { create :record, :with_dot, name: 'Public Record 2', user: user, is_public: true }
  let!(:record3) { create :record, :with_dot, name: 'Public Record 3', user: user, is_public: false }

  let!(:connection_type) { create :connection_type }

  let!(:group) { create :group, user: user, connection_type: nil, record_b: record1 } # nil, because we are testing when it is unchecked
  let!(:affiliation1) { create :affiliation, group: group, record_a: record2 }
  let!(:affiliation2) { create :affiliation, group: group, record_a: record3 }

  before { login_as user }
  before { visit edit_group_path(group) }

  it do
    expect(Affiliation.where(record_a: record2).count).to eq 1
    expect(Connection.where(record_a: record2).count).to eq 0
    click_on 'Save Everything'
    expect(Affiliation.where(record_a: record2).count).to eq 1
    expect(Connection.where(record_a: record2).count).to eq 0
  end
end
