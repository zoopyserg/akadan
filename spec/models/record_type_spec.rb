require 'rails_helper'

RSpec.describe RecordType, type: :model do
  it { should belong_to :user }
end
