require 'rails_helper'

RSpec.describe Dot, type: :model do
  it { should belong_to :user }
  it { should belong_to :record }
end
