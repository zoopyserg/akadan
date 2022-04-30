require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'relations' do
    it { should belong_to :user }
    it { should belong_to(:commentable) }
  end

  # todo: test scopes (they are copied from a tested gem)
end
