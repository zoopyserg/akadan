# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create! username: 'user1', email: 'dude1@me.com', first_name: 'Dude', last_name: 'Dubidud', password: '11111111', password_confirmation: '11111111', accept_terms: true
user2 = User.create! username: 'user2', email: 'dude2@me.com', first_name: 'Dude', last_name: 'Dubidud', password: '11111111', password_confirmation: '11111111', accept_terms: true

conversation = Conversation.create!

Participation.create! conversation: conversation, user: user1
Participation.create! conversation: conversation, user: user2

message = Message.create! body: "some body", sender: user1, conversation: conversation

Reading.create user: user1, message: message, read: false
Reading.create user: user2, message: message, read: true

User.create! username: 'user3', email: 'dude3@me.com', first_name: 'Giana', last_name: 'Michaels', password: '11111111', password_confirmation: '11111111', accept_terms: true
User.create! username: 'user4', email: 'dude4@me.com', first_name: 'Some', last_name: 'Chick', password: '11111111', password_confirmation: '11111111', accept_terms: true
User.create! username: 'user5', email: 'dude5@me.com', first_name: 'Some', last_name: 'President', password: '11111111', password_confirmation: '11111111', accept_terms: true
User.create! username: 'user6', email: 'dude6@me.com', first_name: 'Chick', last_name: 'Ducksuckers', password: '11111111', password_confirmation: '11111111', accept_terms: true
User.create! username: 'user7', email: 'dude7@me.com', first_name: 'Porn', last_name: 'Star', password: '11111111', password_confirmation: '11111111', accept_terms: true
