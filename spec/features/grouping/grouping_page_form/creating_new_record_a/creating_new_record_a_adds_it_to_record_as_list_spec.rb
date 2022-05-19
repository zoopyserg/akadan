require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user) { create :user, :confirmed }
  let!(:record_type1) { create :record_type, name: 'Old Record Type', is_public: true }
  let!(:record_type2) { create :record_type, name: 'The Magic Record Type', is_public: true }
  let!(:record0) { create :record, :with_dot, name: 'Public Record 0', user: user, record_type: record_type1, is_public: true }
  let!(:record1) { create :record, :with_dot, name: 'Public Record 1', user: user, record_type: record_type1, is_public: true }
  let!(:record2) { create :record, :with_dot, name: 'Public Record 2', user: user, record_type: record_type1, is_public: true }
  let!(:record3) { create :record, :with_dot, name: 'Public Record 3', user: user, record_type: record_type1, is_public: false }

  let!(:connection_type) { create :connection_type, is_public: true }

  let!(:group) { create :group, user: user, connection_type: connection_type, record_b: record1 }
  let!(:affiliation1) { create :affiliation, group: group, record_a: record2 }
  let!(:affiliation2) { create :affiliation, group: group, record_a: record3 }

  before { login_as user }
  before { visit edit_group_path(group) }

  it do
    fill_in 'group_new_record_a_name', with: 'Some Magic Record'
    choose_something('The Magic Record Type', '.new_record_a_record_type_section')
    click_on 'Add Record A'

    expect(Record.where(name: 'Some Magic Record').count).to eq 1
  end

  it do
    expect(Connection.count).to eq 2

    fill_in 'group_new_record_a_name', with: 'Some Magic Record'
    choose_something('The Magic Record Type', '.new_record_a_record_type_section')
    click_on 'Add Record A'

    expect(Connection.count).to eq 3
  end

  it do
    expect(group.affiliations.count).to eq 2

    fill_in 'group_new_record_a_name', with: 'Some Magic Record'
    choose_something('The Magic Record Type', '.new_record_a_record_type_section')
    click_on 'Add Record A'

    expect(group.affiliations.all.collect{|x| x.record_a.name}.uniq).to include 'Some Magic Record'
  end

  it do
    expect(Connection.count).to eq 2

    fill_in 'group_new_record_a_name', with: 'Some Magic Record'
    choose_something('The Magic Record Type', '.new_record_a_record_type_section')
    click_on 'Add Record A'

    expect(Connection.all.collect{|x| x.record_a.name}.uniq).to include 'Some Magic Record'
  end
end
