require 'rails_helper'

RSpec.describe UserRecordStat, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:record) }
end
