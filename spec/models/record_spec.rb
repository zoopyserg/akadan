require 'rails_helper'

RSpec.describe Record, type: :model do
  it { should belong_to :user }
  it { should belong_to :record_type }
  it { should have_many(:dots).dependent(:destroy) }
end
