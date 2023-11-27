require 'rails_helper'

RSpec.describe RecordType, type: :model do
  it { should belong_to :user }

  describe 'do not create duplicate system names', :do_not_create_data do
    describe 'Subsystem' do
      let!(:record_type1) { create(:record_type, name: RecordType::SUBSYSTEM_NAME) }
      let!(:record_type2) { build(:record_type, name: RecordType::SUBSYSTEM_NAME) }

      it { expect(record_type2).not_to be_valid }
    end

    describe 'Solution' do
      let!(:record_type1) { create(:record_type, name: RecordType::SOLUTION_NAME) }
      let!(:record_type2) { build(:record_type, name: RecordType::SOLUTION_NAME) }

      it { expect(record_type2).not_to be_valid }
    end
  end
end
