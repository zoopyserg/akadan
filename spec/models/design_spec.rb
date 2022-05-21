require 'rails_helper'

RSpec.describe Design, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:designable) }
  it { should have_many(:columns) }
end
