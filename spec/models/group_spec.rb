require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'relations' do
    it { should belong_to :user }
    it { should belong_to(:connection_type).optional(true) }
    it { should belong_to(:record_b).optional(true) }
    it { should have_many(:affiliations) }
    it { should have_many(:record_as).class_name('Record') }
  end

  describe 'deleting record b if it can not build a connection' do
    describe 'keep the record that can be parent for everyone as a parent' do
      let!(:user) { create :user, :confirmed }
      let!(:record1) { create :record, :with_dot, name: 'Public Record 1', user: user, is_public: true }
      let!(:record2) { create :record, :with_dot, name: 'Public Record 2', user: user, is_public: true }
      let!(:record3) { create :record, :with_dot, name: 'Public Record 3', user: user, is_public: false }

      let!(:connection_type) { create :connection_type, name: 'Connection Type 2', is_public: true }

      let!(:group) { create :group, user: user, connection_type: connection_type, record_b: record1 }

      before do
        group.record_as << record2
        group.record_as << record3
        group.save!
      end

      it { expect(group.reload.record_b).to eq record1 }
    end

    describe 'clearing record_b if any of record as can not have it as record b' do
      let!(:user1) { create :user, :confirmed }
      let!(:user2) { create :user, :confirmed }

      let!(:record) { create :record, :with_dot, name: 'Main Record', user: user1, is_public: false }
      let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
      let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user2, is_public: true }
      let!(:private_record1) { create :record, :with_dot, name: 'Private Record 1', user: user1, is_public: false }
      let!(:private_record2) { create :record, :with_dot, name: 'Private Record 2', user: user2, is_public: false }

      let!(:connection_type) { create :connection_type, is_public: true }

      let!(:group) { create :group, user: user1, connection_type: connection_type, record_b: record }

      let!(:affiliation1) { create :affiliation, group: group, record_a: public_record2 }

      let!(:connection) { create :connection, record_a: public_record1, record_b: private_record1 }

      before do
        group.record_b = public_record1
        group.record_as << public_record1
        group.record_as << private_record1
        group.save!
      end

      it { expect(group.reload.record_b).to be_nil }
    end
  end
end
