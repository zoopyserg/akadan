require 'rails_helper'

RSpec.describe Connection, type: :model do
  it { should belong_to :user }
end
