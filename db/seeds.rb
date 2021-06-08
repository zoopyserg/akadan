require 'factory_bot_rails'
require 'faker'

user1 = FactoryBot.build :user
user2 = FactoryBot.build :user

user1.skip_confirmation!
user2.skip_confirmation!

user1.save!
user2.save!

# messaging between users 1 & 2
conversation = FactoryBot.create :conversation

FactoryBot.create :participation, conversation: conversation, user: user1
FactoryBot.create :participation, conversation: conversation, user: user2

message = FactoryBot.create :message, body: "some body", sender: user1, conversation: conversation

FactoryBot.create :reading, user: user1, message: message, read: false
FactoryBot.create :reading, user: user2, message: message, read: true


# public/private types/records etc.
10.times do
  FactoryBot.create :record, user: user1, is_public: true
end

10.times do
  FactoryBot.create :record, user: user2, is_public: false
end

10.times do
  FactoryBot.create :connection_type, user: user1, is_public: true
end

10.times do
  FactoryBot.create :connection_type, user: user2, is_public: false
end

10.times do
  FactoryBot.create :record_type, user: user1, is_public: true
end

10.times do
  FactoryBot.create :record_type, user: user2, is_public: false
end

# a bunch of random users
10.times do
  user = FactoryBot.build :user
  user.skip_confirmation!
  user.save!

  Faker::Number.within(range: 1..10).times do
    FactoryBot.create :record, user: user, is_public: true
  end

  Faker::Number.within(range: 1..10).times do
    FactoryBot.create :record, user: user, is_public: false
  end

  Faker::Number.within(range: 1..10).times do
    FactoryBot.create :connection_type, user: user, is_public: true
  end

  Faker::Number.within(range: 1..10).times do
    FactoryBot.create :connection_type, user: user, is_public: false
  end

  Faker::Number.within(range: 1..10).times do
    FactoryBot.create :record_type, user: user, is_public: true
  end

  Faker::Number.within(range: 1..10).times do
    FactoryBot.create :record_type, user: user, is_public: false
  end
end
