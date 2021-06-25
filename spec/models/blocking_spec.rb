require 'rails_helper'

RSpec.describe Blocking, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:blocked_user).class_name('User') }
end
