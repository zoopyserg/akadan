# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.new username: 'user1', email: 'dude1@me.com', first_name: 'Dude', last_name: 'Dubidud', password: '11111111', password_confirmation: '11111111', accept_terms: true
user2 = User.new username: 'user2', email: 'dude2@me.com', first_name: 'Dude', last_name: 'Dubidud', password: '11111111', password_confirmation: '11111111', accept_terms: true

user1.skip_confirmation!
user2.skip_confirmation!

user1.save!
user2.save!

conversation = Conversation.create!

Participation.create! conversation: conversation, user: user1
Participation.create! conversation: conversation, user: user2

ct1 = ConnectionType.create! user: user1, name: 'Lorem Ipsum'
ct2 = ConnectionType.create! user: user2, name: 'Lorems Ipsums'

message = Message.create! body: "some body", sender: user1, conversation: conversation

Reading.create user: user1, message: message, read: false
Reading.create user: user2, message: message, read: true

user3 = User.new username: 'user3', email: 'dude3@me.com', first_name: 'Giana', last_name: 'Michaels', password: '11111111', password_confirmation: '11111111', accept_terms: true
user4 = User.new username: 'user4', email: 'dude4@me.com', first_name: 'Some', last_name: 'Chick', password: '11111111', password_confirmation: '11111111', accept_terms: true
user5 = User.new username: 'user5', email: 'dude5@me.com', first_name: 'Some', last_name: 'President', password: '11111111', password_confirmation: '11111111', accept_terms: true
user6 = User.new username: 'user6', email: 'dude6@me.com', first_name: 'Chick', last_name: 'Ducksuckers', password: '11111111', password_confirmation: '11111111', accept_terms: true
user7 = User.new username: 'user7', email: 'dude7@me.com', first_name: 'Porn', last_name: 'Star', password: '11111111', password_confirmation: '11111111', accept_terms: true

user3.skip_confirmation!
user4.skip_confirmation!
user5.skip_confirmation!
user6.skip_confirmation!
user7.skip_confirmation!

user3.save!
user4.save!
user5.save!
user6.save!
user7.save!
