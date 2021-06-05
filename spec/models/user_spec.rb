require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:records).dependent(:destroy) }
  it { should have_many(:record_types).dependent(:destroy) }
  it { should have_many(:connection_types).dependent(:destroy) }
  it { should have_many(:connections).dependent(:destroy) }
  it { should have_many(:sensors).dependent(:destroy) }
  # it { should have_many(:messages).dependent(:destroy) }
  it { should have_many(:message_chains).dependent(:destroy) }

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }

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
end
