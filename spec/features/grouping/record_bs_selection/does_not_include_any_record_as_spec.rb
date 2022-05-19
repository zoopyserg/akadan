require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:record) { create :record, :with_dot, name: 'Main Record', user: user1, is_public: false }
  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user2, is_public: true }
  let!(:private_record1) { create :record, :with_dot, name: 'Private Record 1', user: user1, is_public: false }
  let!(:private_record2) { create :record, :with_dot, name: 'Private Record 2', user: user2, is_public: false }

  let!(:record4) { create :record, :with_dot, name: 'Some Magic Record', is_public: true }

  let!(:connection_type) { create :connection_type, is_public: true }

  let!(:group) { create :group, user: user1, connection_type: connection_type, record_b: record }

  let!(:affiliation1) { create :affiliation, group: group, record_a: public_record1 }

  before { login_as user1 }
  before { visit edit_group_path(group) }

  it do
    expect_dropdown_not_to_contain_option('.record_b_selection_section', 'Public Record 1')
    expect_dropdown_to_contain_option('.record_b_selection_section', 'Public Record 2')
    expect_dropdown_to_contain_option('.record_b_selection_section', 'Private Record 1')
    expect_dropdown_not_to_contain_option('.record_b_selection_section', 'Private Record 2')
  end
end
