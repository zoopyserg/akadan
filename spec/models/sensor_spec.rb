require 'rails_helper'

RSpec.describe Sensor, type: :model do
  it { should belong_to :user }
end
