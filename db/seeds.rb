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

%i[ record connection_type record_type sensor connection ].each do |item|
  10.times do
    FactoryBot.create item, user: user1, is_public: Faker::Boolean.boolean
  end
end


# a bunch of random users
10.times do
  user = FactoryBot.build :user
  user.skip_confirmation!
  user.save!

  %i[ record connection_type record_type sensor connection ].each do |item|
    10.times do
      FactoryBot.create item, user: user, is_public: Faker::Boolean.boolean
    end
  end
end
