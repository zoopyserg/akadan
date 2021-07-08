require 'factory_bot_rails'
require 'faker'

user1 = FactoryBot.build :user, email: 'sergevinogradoff.personal@gmail.com', password: '12345678', password_confirmation: '12345678'
user2 = FactoryBot.build :user

user1.skip_confirmation!
user2.skip_confirmation!

user1.save!
user2.save!

# needed for production
FactoryBot.create :connection_type, name: 'Subsystem', user: user1, is_public: true
FactoryBot.create :connection_type, name: 'Irrelevant Because...', user: user1, is_public: true
FactoryBot.create :record_type, name: 'Subsystem', user: user1, is_public: true
# end of stuff needed for production

# messaging between users 1 & 2
conversation = FactoryBot.create :conversation

FactoryBot.create :participation, conversation: conversation, user: user1
FactoryBot.create :participation, conversation: conversation, user: user2

message = FactoryBot.create :message, body: "some body", sender: user1, conversation: conversation

FactoryBot.create :reading, user: user1, message: message, read: false
FactoryBot.create :reading, user: user2, message: message, read: true

100.times do
  friend = FactoryBot.build :user
  friend.skip_confirmation!
  friend.save!
  FactoryBot.create :friend_request, user: user1, friend: friend
  FactoryBot.create :friend_request, user: friend, friend: user1
end


# public/private types/records etc.

%i[ record connection_type record_type sensor connection ].each do |item|
  Faker::Number.digit.times do
    FactoryBot.create item, user: user1, is_public: Faker::Boolean.boolean
  end
end


# a bunch of random users
Faker::Number.digit.times do
  user = FactoryBot.build :user
  user.skip_confirmation!
  user.save!

  %i[ record connection_type record_type sensor connection ].each do |item|
    Faker::Number.digit.times do
      FactoryBot.create item, user: user, is_public: Faker::Boolean.boolean
    end
  end
end
