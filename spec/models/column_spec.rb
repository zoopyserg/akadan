require 'rails_helper'

RSpec.describe Column, type: :model do
  it { should belong_to(:design) }

  describe 'filter_solved_status enum' do
    it 'should have the correct values' do
      expect(Column.filter_solved_statuses.keys).to eq(['any', 'solved', 'unsolved'])
      expect(Column.filter_solved_statuses.values).to eq([0, 1, 2])
    end

  end
end
