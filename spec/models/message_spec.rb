require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should belong_to(:sender).class_name('User') }
  it { should belong_to(:conversation) }
  it { should have_many(:readings).dependent(:destroy) }
  it { should have_many(:users).through(:readings) }

  it { should validate_presence_of(:body) }

  describe 'scopes' do
    describe '::latest_first' do
      let!(:message1) { create :message, created_at: 2.days.ago }
      let!(:message2) { create :message, created_at: 1.day.ago }
      let!(:message3) { create :message, created_at: 5.days.ago }

      it { expect(Message.latest_first).to eq [message2, message1, message3] }
    end
  end
end
