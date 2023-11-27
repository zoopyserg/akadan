require 'rails_helper'

RSpec.describe ConnectionType, type: :model do
  it { should belong_to :user }
  it { should belong_to(:target_record_type).class_name('RecordType').optional(true) }
  it { should belong_to(:target_record_subtype).class_name('RecordType').optional(true) }
  it { should belong_to(:closest_parent_type).class_name('RecordType').optional(true) }

  it { should validate_presence_of(:name) }

  describe 'do not create duplicate system names', :do_not_create_data do
    describe 'Subsystem' do
      let!(:connection_type1) { create(:connection_type, name: ConnectionType::SUBSYSTEM_NAME) }
      let!(:connection_type2) { build(:connection_type, name: ConnectionType::SUBSYSTEM_NAME) }

      it { expect(connection_type2).not_to be_valid }
    end

    describe 'Is Solved By' do
      let!(:connection_type1) { create(:connection_type, name: ConnectionType::IS_SOLVED_BY_NAME) }
      let!(:connection_type2) { build(:connection_type, name: ConnectionType::IS_SOLVED_BY_NAME) }

      it { expect(connection_type2).not_to be_valid }
    end

    describe 'Extracted To' do
      let!(:connection_type1) { create(:connection_type, name: ConnectionType::EXTRACTED_TO_NAME) }
      let!(:connection_type2) { build(:connection_type, name: ConnectionType::EXTRACTED_TO_NAME) }

      it { expect(connection_type2).not_to be_valid }
    end

    describe 'Irrelevant Because' do
      let!(:connection_type1) { create(:connection_type, name: ConnectionType::IRRELEVANT_BECAUSE_NAME) }
      let!(:connection_type2) { build(:connection_type, name: ConnectionType::IRRELEVANT_BECAUSE_NAME) }

      it { expect(connection_type2).not_to be_valid }
    end
  end
end
