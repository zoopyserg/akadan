require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:records).dependent(:destroy) }
  it { should have_many(:record_types).dependent(:destroy) }
  it { should have_many(:connection_types).dependent(:destroy) }
  it { should have_many(:connections).dependent(:destroy) }
  it { should have_many(:sensors).dependent(:destroy) }
  it { should have_many(:user_record_stats).dependent(:destroy) }

  it { should have_many(:sent_messages).class_name('Message').with_foreign_key('sender_id') }

  it { should have_many(:readings).dependent(:destroy) }
  it { should have_many(:messages).through(:readings) }

  # not making the inverse connection for now
  it { should have_many(:bookmarks).dependent(:destroy) }
  it { should have_many(:favourite_records).through(:bookmarks).source(:record) }

  it { should have_many(:participations).dependent(:destroy) }
  it { should have_many(:conversations).through(:participations) }

  it { should have_many(:friend_requests).dependent(:destroy) }
  it { should have_many(:friends).through(:friend_requests).class_name('User').with_foreign_key('friend_id') }
  it { should have_many(:users).through(:friend_requests) }

  it { should have_many(:blockings).dependent(:destroy) }
  it { should have_many(:blocked_users).through(:blockings).class_name('User').with_foreign_key('blocked_user_id') }

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:username) }
    # it { should validate_uniqueness_of(:username) } # removed because of conflicts with Devise keys setup, but it works (tested in features/signup)

    it { should allow_value(true).for(:accept_terms) }
    it { should_not allow_value(false).for(:accept_terms) }
    it { should_not allow_value(nil).for(:accept_terms) }

    describe 'first name' do
      it { should allow_value('Vasia').for(:first_name) }
      it { should allow_value('Вася').for(:first_name) }
      it { should allow_value('Соломія').for(:first_name) }
      it { should allow_value("Слов'яна").for(:first_name) }
      it { should allow_value("Ramón").for(:first_name) }
      it { should allow_value("Նարեկ").for(:first_name) }
      it { should allow_value("峰").for(:first_name) }
      it { should allow_value("莉子").for(:first_name) }
      it { should allow_value("Fríði").for(:first_name) }
      it { should allow_value("Γεωργία").for(:first_name) }
      it { should allow_value("ბარბარე").for(:first_name) }
      it { should allow_value("Анђела").for(:first_name) }

      it { should_not allow_value('I have spaces').for(:first_name) }
      it { should_not allow_value('number9').for(:first_name) }
      it { should_not allow_value('v*&)@!asia').for(:first_name) }
      it { should_not allow_value('under_score').for(:first_name) }
    end

    describe 'last name' do
      it { should allow_value('Vasia').for(:last_name) }
      it { should allow_value('Вася').for(:last_name) }
      it { should allow_value('Соломія').for(:last_name) }
      it { should allow_value("Слов'яна").for(:last_name) }
      it { should allow_value("Ramón").for(:last_name) }
      it { should allow_value("Նարեկ").for(:last_name) }
      it { should allow_value("峰").for(:last_name) }
      it { should allow_value("莉子").for(:last_name) }
      it { should allow_value("Fríði").for(:last_name) }
      it { should allow_value("Γεωργία").for(:last_name) }
      it { should allow_value("ბარბარე").for(:last_name) }
      it { should allow_value("Анђела").for(:last_name) }

      it { should_not allow_value('I have spaces').for(:last_name) }
      it { should_not allow_value('number9').for(:last_name) }
      it { should_not allow_value('v*&)@!asia').for(:last_name) }
      it { should_not allow_value('under_score').for(:last_name) }
    end

    describe 'username' do
      it { should allow_value('Vasia').for(:username) }
      it { should allow_value('Va_sia').for(:username) }
      it { should allow_value('Vasia58').for(:username) }
      it { should allow_value('Vasia_58').for(:username) }

      it { should_not allow_value('Вася').for(:username) }
      it { should_not allow_value('Соломія').for(:username) }
      it { should_not allow_value("Слов'яна").for(:username) }
      it { should_not allow_value("Ramón").for(:username) }
      it { should_not allow_value("Նարեկ").for(:username) }
      it { should_not allow_value("峰").for(:username) }
      it { should_not allow_value("莉子").for(:username) }
      it { should_not allow_value("Fríði").for(:username) }
      it { should_not allow_value("Γεωργία").for(:username) }
      it { should_not allow_value("ბარბარე").for(:username) }
      it { should_not allow_value("Анђела").for(:username) }
      it { should_not allow_value('I have spaces').for(:username) }
      it { should_not allow_value('v*&)@!asia').for(:username) }
    end
  end

  describe 'methods' do
    describe '#name' do
      let!(:user) { create :user, first_name: 'John', last_name: 'Wick' }

      it { expect(user.name).to eq 'John Wick' }
    end
  end
end
