require 'rails_helper'

RSpec.describe Affiliation, type: :model do
  describe 'relations' do
    it { should belong_to :group }
    it { should belong_to(:record_a).class_name('Record') }
  end

  describe 'connections' do
    context 'everything is present for it' do
      let!(:user) { create :user, :confirmed }
      let!(:record1) { create :record, :with_dot, name: 'Public Record 1', user: user, is_public: true }
      let!(:record2) { create :record, :with_dot, name: 'Public Record 2', user: user, is_public: true }

      let!(:connection_type) { create :connection_type }

      let!(:group) { create :group, user: user, connection_type: connection_type, record_b: record1 }

      let!(:affiliation1) { create :affiliation, group: group, record_a: record2 }

      let(:connections_count) { group.connections.where(record_a: record2, record_b: record1).count }

      it { expect(connections_count).to eq 1 }

      it do
        affiliation1.destroy
        expect(connections_count).to eq 0
      end
    end

    context 'tried to create twice' do
      let!(:user) { create :user, :confirmed }
      let!(:record1) { create :record, :with_dot, name: 'Public Record 1', user: user, is_public: true }
      let!(:record2) { create :record, :with_dot, name: 'Public Record 2', user: user, is_public: true }

      let!(:connection_type) { create :connection_type }

      let!(:group) { create :group, user: user, connection_type: connection_type, record_b: record1 }

      let!(:affiliation1) { create :affiliation, group: group, record_a: record2 }
      let!(:affiliation2) { create :affiliation, group: group, record_a: record2 }

      let(:connections_count) { group.connections.where(record_a: record2, record_b: record1).count }

      it { expect(connections_count).to eq 1 }

      it do
        affiliation1.destroy
        expect(connections_count).to eq 0
      end
    end

    context 'no record b' do
      let!(:user) { create :user, :confirmed }
      let!(:record1) { create :record, :with_dot, name: 'Public Record 1', user: user, is_public: true }
      let!(:record2) { create :record, :with_dot, name: 'Public Record 2', user: user, is_public: true }

      let!(:connection_type) { create :connection_type }

      let!(:group) { create :group, user: user, connection_type: connection_type, record_b: nil }

      let!(:affiliation1) { create :affiliation, group: group, record_a: record2 }

      let(:connections_count) { group.connections.where(record_a: record2, record_b: record1).count }

      it { expect(connections_count).to eq 0 }
    end

    context 'no connection type' do
      let!(:user) { create :user, :confirmed }
      let!(:record1) { create :record, :with_dot, name: 'Public Record 1', user: user, is_public: true }
      let!(:record2) { create :record, :with_dot, name: 'Public Record 2', user: user, is_public: true }

      let!(:connection_type) { create :connection_type }

      let!(:group) { create :group, user: user, connection_type: nil, record_b: record1 }

      let!(:affiliation1) { create :affiliation, group: group, record_a: record2 }

      let(:connections_count) { group.connections.where(record_a: record2, record_b: record1).count }

      it { expect(connections_count).to eq 0 }
    end
  end
end
