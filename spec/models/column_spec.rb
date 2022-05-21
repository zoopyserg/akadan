require 'rails_helper'

RSpec.describe Column, type: :model do
  it { should belong_to(:design) }
end
