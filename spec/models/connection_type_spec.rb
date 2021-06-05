require 'rails_helper'

RSpec.describe ConnectionType, type: :model do
  it { should belong_to :user }
end
