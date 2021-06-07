require 'rails_helper'

RSpec.describe Conversation, type: :model do
  it { should have_many(:messages) }
  it { should have_many(:participations) }
  it { should have_many(:users).through(:participations) }
end
