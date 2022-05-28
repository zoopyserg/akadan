require 'rails_helper'

RSpec.describe Connection, type: :model do
  it { should belong_to :user }
  it { should belong_to(:group).optional(true) }
  it { should belong_to(:record_a).class_name('Record') }
  it { should belong_to(:record_b).class_name('Record') }
  it { should belong_to(:connection_type) }
end
