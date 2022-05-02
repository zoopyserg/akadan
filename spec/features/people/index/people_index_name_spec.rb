require 'rails_helper'

RSpec.feature "People Index Names", type: :feature do
  let!(:user1) do
    create :user, :confirmed, :free, username: 'something',
      first_name: 'John',
      last_name: 'Wick',
      email: 'me@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:stranger) do
    create :user, :confirmed, :free, username: 'stranger',
      first_name: 'Stranger',
      last_name: 'Public',
      email: 'stranger@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:stranger_protected) do
    create :user, :confirmed, :free, username: 'stranger_protected',
      first_name: 'Stranger',
      last_name: 'Protected',
      email: 'stranger_protected@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: false
  end

  let!(:friend) do
    create :user, :confirmed, :free, username: 'friend',
      first_name: 'Friend',
      last_name: 'Dude',
      email: 'friend@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:friend_private) do
    create :user, :confirmed, :free, username: 'friend_private',
      first_name: 'Friend',
      last_name: 'Private',
      email: 'friend_private@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: false
  end

  let!(:friend_request_sent_to_him) do
    create :user, :confirmed, :free, username: 'friend_request_sent_to_him',
      first_name: 'Outgoing',
      last_name: 'Friend',
      email: 'friend_request_sent_to_him@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:friend_request_sent_to_him_private) do
    create :user, :confirmed, :free, username: 'friend_request_sent_to_him_private',
      first_name: 'Outgoing',
      last_name: 'FriendPrivate',
      email: 'friend_request_sent_to_him_private@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: false
  end

  let!(:friend_request_sent_to_me) do
    create :user, :confirmed, :free, username: 'friend_request_sent_to_me',
      first_name: 'Incoming',
      last_name: 'Friend',
      email: 'friend_request_sent_to_me@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:friend_request_sent_to_me_private) do
    create :user, :confirmed, :free, username: 'friend_request_sent_to_me_private',
      first_name: 'Incoming',
      last_name: 'FriendPrivate',
      email: 'friend_request_sent_to_me_private@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: false
  end

  let!(:blacklisted) do
    create :user, :confirmed, :free, username: 'blacklisted',
      first_name: 'Blacklisted',
      last_name: 'Dude',
      email: 'blacklisted@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:blacklisted_me) do
    create :user, :confirmed, :free, username: 'blacklisted_me',
      first_name: 'Blacklisted',
      last_name: 'Me',
      email: 'blacklisted_me@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:friend_request_1) { create :friend_request, user: user1, friend: friend }
  let!(:friend_request_2) { create :friend_request, user: friend, friend: user1 }

  let!(:friend_request_3) { create :friend_request, user: user1, friend: friend_private }
  let!(:friend_request_4) { create :friend_request, user: friend_private, friend: user1 }

  let!(:friend_request_5) { create :friend_request, user: user1, friend: friend_request_sent_to_him }
  let!(:friend_request_6) { create :friend_request, user: user1, friend: friend_request_sent_to_him_private }

  let!(:friend_request_7) { create :friend_request, user: friend_request_sent_to_me, friend: user1 }
  let!(:friend_request_8) { create :friend_request, user: friend_request_sent_to_me_private, friend: user1 }

  let!(:blacklisted_connection) { create :blocking, user: user1, blocked_user: blacklisted }
  let!(:blacklisted_me_connection) { create :blocking, user: blacklisted_me, blocked_user: user1 }

  context 'not signed in' do
    before { visit people_path }

    it { expect(page).to have_link 'John Wick', href: user_path(user1) }
    it { expect(page).to have_link 'Stranger Public', href: user_path(stranger) }
    it { expect(page).to have_no_link 'Stranger Protected', href: user_path(stranger_protected) }
    it { expect(page).to have_link 'Friend Dude', href: user_path(friend) }
    it { expect(page).to have_no_link 'Friend Private', href: user_path(friend_private) }
    it { expect(page).to have_link 'Outgoing Friend', href: user_path(friend_request_sent_to_him) }
    it { expect(page).to have_no_link 'Outgoing FriendPrivate', href: user_path(friend_request_sent_to_him_private) }
    it { expect(page).to have_link 'Incoming Friend', href: user_path(friend_request_sent_to_me) }
    it { expect(page).to have_no_link 'Incoming FriendPrivate', href: user_path(friend_request_sent_to_me_private) }
    it { expect(page).to have_link 'Blacklisted Dude', href: user_path(blacklisted) }
    it { expect(page).to have_link 'Blacklisted Me', href: user_path(blacklisted_me) }
  end

  context 'signed in' do
    context 'I sign in' do
      before do
        login_as user1
        visit people_path
      end

      it { expect(page).to have_no_link 'John Wick', href: user_path(user1) }
      it { expect(page).to have_link 'Stranger Public', href: user_path(stranger) }
      it { expect(page).to have_no_link 'Stranger Protected', href: user_path(stranger_protected) }
      it { expect(page).to have_link 'Friend Dude', href: user_path(friend) }
      it { expect(page).to have_link 'Friend Private', href: user_path(friend_private) }
      it { expect(page).to have_link 'Outgoing Friend', href: user_path(friend_request_sent_to_him) }
      it { expect(page).to have_no_link 'Outgoing FriendPrivate', href: user_path(friend_request_sent_to_him_private) }
      it { expect(page).to have_link 'Incoming Friend', href: user_path(friend_request_sent_to_me) }
      it { expect(page).to have_no_link 'Incoming FriendPrivate', href: user_path(friend_request_sent_to_me_private) }
      it { expect(page).to have_no_link 'Blacklisted Dude', href: user_path(blacklisted) }
      it { expect(page).to have_no_link 'Blacklisted Me', href: user_path(blacklisted_me) }
    end

    context 'stranger@gmail.com signs in' do
      before do
        login_as stranger
        visit people_path
      end

      it { expect(page).to have_link 'John Wick', href: user_path(user1) }
      it { expect(page).to have_no_link 'Stranger Public', href: user_path(stranger) }
      it { expect(page).to have_no_link 'Stranger Protected', href: user_path(stranger_protected) }
      it { expect(page).to have_link 'Friend Dude', href: user_path(friend) }
      it { expect(page).to have_no_link 'Friend Private', href: user_path(friend_private) }
      it { expect(page).to have_link 'Outgoing Friend', href: user_path(friend_request_sent_to_him) }
      it { expect(page).to have_no_link 'Outgoing FriendPrivate', href: user_path(friend_request_sent_to_him_private) }
      it { expect(page).to have_link 'Incoming Friend', href: user_path(friend_request_sent_to_me) }
      it { expect(page).to have_no_link 'Incoming FriendPrivate', href: user_path(friend_request_sent_to_me_private) }
      it { expect(page).to have_link 'Blacklisted Dude', href: user_path(blacklisted) }
      it { expect(page).to have_link 'Blacklisted Me', href: user_path(blacklisted_me) }
    end

    context 'stranger_protected@gmail.com signs in' do
      before do
        login_as stranger_protected
        visit people_path
      end

      it { expect(page).to have_link 'John Wick', href: user_path(user1) }
      it { expect(page).to have_link 'Stranger Public', href: user_path(stranger) }
      it { expect(page).to have_no_link 'Stranger Protected', href: user_path(stranger_protected) }
      it { expect(page).to have_link 'Friend Dude', href: user_path(friend) }
      it { expect(page).to have_no_link 'Friend Private', href: user_path(friend_private) }
      it { expect(page).to have_link 'Outgoing Friend', href: user_path(friend_request_sent_to_him) }
      it { expect(page).to have_no_link 'Outgoing FriendPrivate', href: user_path(friend_request_sent_to_him_private) }
      it { expect(page).to have_link 'Incoming Friend', href: user_path(friend_request_sent_to_me) }
      it { expect(page).to have_no_link 'Incoming FriendPrivate', href: user_path(friend_request_sent_to_me_private) }
      it { expect(page).to have_link 'Blacklisted Dude', href: user_path(blacklisted) }
      it { expect(page).to have_link 'Blacklisted Me', href: user_path(blacklisted_me) }
    end

    context 'friend@gmail.com signs in' do
      before do
        login_as friend
        visit people_path
      end

      it { expect(page).to have_link 'John Wick', href: user_path(user1) }
      it { expect(page).to have_link 'Stranger Public', href: user_path(stranger) }
      it { expect(page).to have_no_link 'Stranger Protected', href: user_path(stranger_protected) }
      it { expect(page).to have_no_link 'Friend Dude', href: user_path(friend) }
      it { expect(page).to have_no_link 'Friend Private', href: user_path(friend_private) }
      it { expect(page).to have_link 'Outgoing Friend', href: user_path(friend_request_sent_to_him) }
      it { expect(page).to have_no_link 'Outgoing FriendPrivate', href: user_path(friend_request_sent_to_him_private) }
      it { expect(page).to have_link 'Incoming Friend', href: user_path(friend_request_sent_to_me) }
      it { expect(page).to have_no_link 'Incoming FriendPrivate', href: user_path(friend_request_sent_to_me_private) }
      it { expect(page).to have_link 'Blacklisted Dude', href: user_path(blacklisted) }
      it { expect(page).to have_link 'Blacklisted Me', href: user_path(blacklisted_me) }
    end

    context 'friend_private@gmail.com signs in' do
      before do
        login_as friend_private
        visit people_path
      end

      it { expect(page).to have_link 'John Wick', href: user_path(user1) }
      it { expect(page).to have_link 'Stranger Public', href: user_path(stranger) }
      it { expect(page).to have_no_link 'Stranger Protected', href: user_path(stranger_protected) }
      it { expect(page).to have_link 'Friend Dude', href: user_path(friend) }
      it { expect(page).to have_no_link 'Friend Private', href: user_path(friend_private) }
      it { expect(page).to have_link 'Outgoing Friend', href: user_path(friend_request_sent_to_him) }
      it { expect(page).to have_no_link 'Outgoing FriendPrivate', href: user_path(friend_request_sent_to_him_private) }
      it { expect(page).to have_link 'Incoming Friend', href: user_path(friend_request_sent_to_me) }
      it { expect(page).to have_no_link 'Incoming FriendPrivate', href: user_path(friend_request_sent_to_me_private) }
      it { expect(page).to have_link 'Blacklisted Dude', href: user_path(blacklisted) }
      it { expect(page).to have_link 'Blacklisted Me', href: user_path(blacklisted_me) }
    end

    context 'friend_request_sent_to_him@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_him
        visit people_path
      end

      it { expect(page).to have_link 'John Wick', href: user_path(user1) }
      it { expect(page).to have_link 'Stranger Public', href: user_path(stranger) }
      it { expect(page).to have_no_link 'Stranger Protected', href: user_path(stranger_protected) }
      it { expect(page).to have_link 'Friend Dude', href: user_path(friend) }
      it { expect(page).to have_no_link 'Friend Private', href: user_path(friend_private) }
      it { expect(page).to have_no_link 'Outgoing Friend', href: user_path(friend_request_sent_to_him) }
      it { expect(page).to have_no_link 'Outgoing FriendPrivate', href: user_path(friend_request_sent_to_him_private) }
      it { expect(page).to have_link 'Incoming Friend', href: user_path(friend_request_sent_to_me) }
      it { expect(page).to have_no_link 'Incoming FriendPrivate', href: user_path(friend_request_sent_to_me_private) }
      it { expect(page).to have_link 'Blacklisted Dude', href: user_path(blacklisted) }
      it { expect(page).to have_link 'Blacklisted Me', href: user_path(blacklisted_me) }
    end

    context 'friend_request_sent_to_him_private@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_him_private
        visit people_path
      end

      it { expect(page).to have_link 'John Wick', href: user_path(user1) }
      it { expect(page).to have_link 'Stranger Public', href: user_path(stranger) }
      it { expect(page).to have_no_link 'Stranger Protected', href: user_path(stranger_protected) }
      it { expect(page).to have_link 'Friend Dude', href: user_path(friend) }
      it { expect(page).to have_no_link 'Friend Private', href: user_path(friend_private) }
      it { expect(page).to have_link 'Outgoing Friend', href: user_path(friend_request_sent_to_him) }
      it { expect(page).to have_no_link 'Outgoing FriendPrivate', href: user_path(friend_request_sent_to_him_private) }
      it { expect(page).to have_link 'Incoming Friend', href: user_path(friend_request_sent_to_me) }
      it { expect(page).to have_no_link 'Incoming FriendPrivate', href: user_path(friend_request_sent_to_me_private) }
      it { expect(page).to have_link 'Blacklisted Dude', href: user_path(blacklisted) }
      it { expect(page).to have_link 'Blacklisted Me', href: user_path(blacklisted_me) }
    end

    context 'friend_request_sent_to_me@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_me
        visit people_path
      end

      it { expect(page).to have_link 'John Wick', href: user_path(user1) }
      it { expect(page).to have_link 'Stranger Public', href: user_path(stranger) }
      it { expect(page).to have_no_link 'Stranger Protected', href: user_path(stranger_protected) }
      it { expect(page).to have_link 'Friend Dude', href: user_path(friend) }
      it { expect(page).to have_no_link 'Friend Private', href: user_path(friend_private) }
      it { expect(page).to have_link 'Outgoing Friend', href: user_path(friend_request_sent_to_him) }
      it { expect(page).to have_no_link 'Outgoing FriendPrivate', href: user_path(friend_request_sent_to_him_private) }
      it { expect(page).to have_no_link 'Incoming Friend', href: user_path(friend_request_sent_to_me) }
      it { expect(page).to have_no_link 'Incoming FriendPrivate', href: user_path(friend_request_sent_to_me_private) }
      it { expect(page).to have_link 'Blacklisted Dude', href: user_path(blacklisted) }
      it { expect(page).to have_link 'Blacklisted Me', href: user_path(blacklisted_me) }
    end

    context 'friend_request_sent_to_me_private@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_me_private
        visit people_path
      end

      it { expect(page).to have_link 'John Wick', href: user_path(user1) }
      it { expect(page).to have_link 'Stranger Public', href: user_path(stranger) }
      it { expect(page).to have_no_link 'Stranger Protected', href: user_path(stranger_protected) }
      it { expect(page).to have_link 'Friend Dude', href: user_path(friend) }
      it { expect(page).to have_no_link 'Friend Private', href: user_path(friend_private) }
      it { expect(page).to have_link 'Outgoing Friend', href: user_path(friend_request_sent_to_him) }
      it { expect(page).to have_no_link 'Outgoing FriendPrivate', href: user_path(friend_request_sent_to_him_private) }
      it { expect(page).to have_link 'Incoming Friend', href: user_path(friend_request_sent_to_me) }
      it { expect(page).to have_no_link 'Incoming FriendPrivate', href: user_path(friend_request_sent_to_me_private) }
      it { expect(page).to have_link 'Blacklisted Dude', href: user_path(blacklisted) }
      it { expect(page).to have_link 'Blacklisted Me', href: user_path(blacklisted_me) }
    end

    context 'blacklisted@gmail.com signs in' do
      before do
        login_as blacklisted
        visit people_path
      end

      it { expect(page).to have_no_link 'John Wick', href: user_path(user1) }
      it { expect(page).to have_link 'Stranger Public', href: user_path(stranger) }
      it { expect(page).to have_no_link 'Stranger Protected', href: user_path(stranger_protected) }
      it { expect(page).to have_link 'Friend Dude', href: user_path(friend) }
      it { expect(page).to have_no_link 'Friend Private', href: user_path(friend_private) }
      it { expect(page).to have_link 'Outgoing Friend', href: user_path(friend_request_sent_to_him) }
      it { expect(page).to have_no_link 'Outgoing FriendPrivate', href: user_path(friend_request_sent_to_him_private) }
      it { expect(page).to have_link 'Incoming Friend', href: user_path(friend_request_sent_to_me) }
      it { expect(page).to have_no_link 'Incoming FriendPrivate', href: user_path(friend_request_sent_to_me_private) }
      it { expect(page).to have_no_link 'Blacklisted Dude', href: user_path(blacklisted) }
      it { expect(page).to have_link 'Blacklisted Me', href: user_path(blacklisted_me) }
    end

    context 'blacklisted_me@gmail.com signs in' do
      before do
        login_as blacklisted_me
        visit people_path
      end

      it { expect(page).to have_no_link 'John Wick', href: user_path(user1) }
      it { expect(page).to have_link 'Stranger Public', href: user_path(stranger) }
      it { expect(page).to have_no_link 'Stranger Protected', href: user_path(stranger_protected) }
      it { expect(page).to have_link 'Friend Dude', href: user_path(friend) }
      it { expect(page).to have_no_link 'Friend Private', href: user_path(friend_private) }
      it { expect(page).to have_link 'Outgoing Friend', href: user_path(friend_request_sent_to_him) }
      it { expect(page).to have_no_link 'Outgoing FriendPrivate', href: user_path(friend_request_sent_to_him_private) }
      it { expect(page).to have_link 'Incoming Friend', href: user_path(friend_request_sent_to_me) }
      it { expect(page).to have_no_link 'Incoming FriendPrivate', href: user_path(friend_request_sent_to_me_private) }
      it { expect(page).to have_link 'Blacklisted Dude', href: user_path(blacklisted) }
      it { expect(page).to have_no_link 'Blacklisted Me', href: user_path(blacklisted_me) }
    end
  end
end

