require 'rails_helper'

RSpec.describe ConnectionType, type: :model do
  it { should belong_to :user }
  it { should belong_to(:target_record_type).class_name('RecordType').optional(true) }
  it { should belong_to(:target_record_subtype).class_name('RecordType').optional(true) }
end
