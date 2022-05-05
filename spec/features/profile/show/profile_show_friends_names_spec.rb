require 'rails_helper'

RSpec.feature "Profile Show Friends Names", type: :feature do
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
    context 'visiting user1 page' do
      before { visit user_path(user1) }

      it { should_have_no_friend 'John Wick' }
    end

    context 'visiting stranger page' do
      before { visit user_path(stranger) }

      it { should_have_no_friend 'Stranger Public' }
    end

    context 'visiting stranger_protected page' do
      before { visit user_path(stranger_protected) }

      it { expect(page).to have_no_css('#friendsContainer') }
    end

    context 'visiting friend page' do
      before { visit user_path(friend) }

      it { should_have_no_friend 'Friend Dude' }
    end

    context 'visiting friend_private page' do
      before { visit user_path(friend_private) }

      it { expect(page).to have_no_css('#friendsContainer') }
    end

    context 'visiting friend_request_sent_to_him page' do
      before { visit user_path(friend_request_sent_to_him) }

      it { should_have_no_friend 'Outgoing Friend' }
    end

    context 'visiting friend_request_sent_to_him_private page' do
      before { visit user_path(friend_request_sent_to_him_private) }

      it { expect(page).to have_no_css('#friendsContainer') }
    end

    context 'visiting friend_request_sent_to_me page' do
      before { visit user_path(friend_request_sent_to_me) }

      it { should_have_no_friend 'Incoming Friend' }
    end

    context 'visiting friend_request_sent_to_me_private page' do
      before { visit user_path(friend_request_sent_to_me_private) }

      it { expect(page).to have_no_css('#friendsContainer') }
    end

    context 'visiting blacklisted page' do
      before { visit user_path(blacklisted) }

      it { should_have_no_friend 'Blacklisted Dude' }
    end

    context 'visiting blacklisted_me page' do
      before { visit user_path(blacklisted_me) }

      it { should_have_no_friend 'Blacklisted Me' }
    end

  end

  context 'signed in' do
    context 'I sign in' do
      before do
        login_as user1
      end

      context 'visiting user1 page' do
        before { visit user_path(user1) }

        it { should_have_no_friend 'John Wick' }
      end

      context 'visiting stranger page' do
        before { visit user_path(stranger) }

        it { should_have_no_friend 'Stranger Public' }
      end

      context 'visiting stranger_protected page' do
        before { visit user_path(stranger_protected) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend page' do
        before { visit user_path(friend) }

        it { should_have_friend 'John Wick' }
      end

      context 'visiting friend_private page' do
        before { visit user_path(friend_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_him page' do
        before { visit user_path(friend_request_sent_to_him) }

        it { should_have_no_friend 'Outgoing Friend' }
      end

      context 'visiting friend_request_sent_to_him_private page' do
        before { visit user_path(friend_request_sent_to_him_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_me page' do
        before { visit user_path(friend_request_sent_to_me) }

        it { should_have_no_friend 'Incoming Friend' }
      end

      context 'visiting friend_request_sent_to_me_private page' do
        before { visit user_path(friend_request_sent_to_me_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting blacklisted page' do
        before { visit user_path(blacklisted) }

        it { should_have_no_friend 'Blacklisted Dude' }
      end

      context 'visiting blacklisted_me page' do
        before { visit user_path(blacklisted_me) }

        it { should_have_no_friend 'Blacklisted Me' }
      end
    end

    context 'stranger@gmail.com signs in' do
      before do
        login_as stranger
        visit people_path
      end

      context 'visiting user1 page' do
        before { visit user_path(user1) }

        it { should_have_no_friend 'John Wick' }
      end

      context 'visiting stranger page' do
        before { visit user_path(stranger) }

        it { should_have_no_friend 'Stranger Public' }
      end

      context 'visiting stranger_protected page' do
        before { visit user_path(stranger_protected) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend page' do
        before { visit user_path(friend) }

        it { should_have_no_friend 'Friend Dude' }
      end

      context 'visiting friend_private page' do
        before { visit user_path(friend_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_him page' do
        before { visit user_path(friend_request_sent_to_him) }

        it { should_have_no_friend 'Outgoing Friend' }
      end

      context 'visiting friend_request_sent_to_him_private page' do
        before { visit user_path(friend_request_sent_to_him_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_me page' do
        before { visit user_path(friend_request_sent_to_me) }

        it { should_have_no_friend 'Incoming Friend' }
      end

      context 'visiting friend_request_sent_to_me_private page' do
        before { visit user_path(friend_request_sent_to_me_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting blacklisted page' do
        before { visit user_path(blacklisted) }

        it { should_have_no_friend 'Blacklisted Dude' }
      end

      context 'visiting blacklisted_me page' do
        before { visit user_path(blacklisted_me) }

        it { should_have_no_friend 'Blacklisted Me' }
      end

    end

    context 'stranger_protected@gmail.com signs in' do
      before do
        login_as stranger_protected
        visit people_path
      end

      context 'visiting user1 page' do
        before { visit user_path(user1) }

        it { should_have_no_friend 'John Wick' }
      end

      context 'visiting stranger page' do
        before { visit user_path(stranger) }

        it { should_have_no_friend 'Stranger Public' }
      end

      context 'visiting stranger_protected page' do
        before { visit user_path(stranger_protected) }

        it { should_have_no_friend 'Stranger Protected' }
      end

      context 'visiting friend page' do
        before { visit user_path(friend) }

        it { should_have_no_friend 'Friend Dude' }
      end

      context 'visiting friend_private page' do
        before { visit user_path(friend_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_him page' do
        before { visit user_path(friend_request_sent_to_him) }

        it { should_have_no_friend 'Outgoing Friend' }
      end

      context 'visiting friend_request_sent_to_him_private page' do
        before { visit user_path(friend_request_sent_to_him_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_me page' do
        before { visit user_path(friend_request_sent_to_me) }

        it { should_have_no_friend 'Incoming Friend' }
      end

      context 'visiting friend_request_sent_to_me_private page' do
        before { visit user_path(friend_request_sent_to_me_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting blacklisted page' do
        before { visit user_path(blacklisted) }

        it { should_have_no_friend 'Blacklisted Dude' }
      end

      context 'visiting blacklisted_me page' do
        before { visit user_path(blacklisted_me) }

        it { should_have_no_friend 'Blacklisted Me' }
      end

    end

    context 'friend@gmail.com signs in' do
      before do
        login_as friend
        visit people_path
      end

      context 'visiting user1 page' do
        before { visit user_path(user1) }

        it { should_have_no_friend 'John Wick' }
      end

      context 'visiting stranger page' do
        before { visit user_path(stranger) }

        it { should_have_no_friend 'Stranger Public' }
      end

      context 'visiting stranger_protected page' do
        before { visit user_path(stranger_protected) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend page' do
        before { visit user_path(friend) }

        it { should_have_no_friend 'Friend Dude' }
      end

      context 'visiting friend_private page' do
        before { visit user_path(friend_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_him page' do
        before { visit user_path(friend_request_sent_to_him) }

        it { should_have_no_friend 'Outgoing Friend' }
      end

      context 'visiting friend_request_sent_to_him_private page' do
        before { visit user_path(friend_request_sent_to_him_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_me page' do
        before { visit user_path(friend_request_sent_to_me) }

        it { should_have_no_friend 'Incoming Friend' }
      end

      context 'visiting friend_request_sent_to_me_private page' do
        before { visit user_path(friend_request_sent_to_me_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting blacklisted page' do
        before { visit user_path(blacklisted) }

        it { should_have_no_friend 'Blacklisted Dude' }
      end

      context 'visiting blacklisted_me page' do
        before { visit user_path(blacklisted_me) }

        it { should_have_no_friend 'Blacklisted Me' }
      end
    end

    context 'friend_private@gmail.com signs in' do
      before do
        login_as friend_private
        visit people_path
      end

      context 'visiting user1 page' do
        before { visit user_path(user1) }

        it { should_have_no_friend 'John Wick' }
      end

      context 'visiting stranger page' do
        before { visit user_path(stranger) }

        it { should_have_no_friend 'Stranger Public' }
      end

      context 'visiting stranger_protected page' do
        before { visit user_path(stranger_protected) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend page' do
        before { visit user_path(friend) }

        it { should_have_no_friend 'Friend Dude' }
      end

      context 'visiting friend_private page' do
        before { visit user_path(friend_private) }

        it { should_have_no_friend 'Friend Private' }
      end

      context 'visiting friend_request_sent_to_him page' do
        before { visit user_path(friend_request_sent_to_him) }

        it { should_have_no_friend 'Outgoing Friend' }
      end

      context 'visiting friend_request_sent_to_him_private page' do
        before { visit user_path(friend_request_sent_to_him_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_me page' do
        before { visit user_path(friend_request_sent_to_me) }

        it { should_have_no_friend 'Incoming Friend' }
      end

      context 'visiting friend_request_sent_to_me_private page' do
        before { visit user_path(friend_request_sent_to_me_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting blacklisted page' do
        before { visit user_path(blacklisted) }

        it { should_have_no_friend 'Blacklisted Dude' }
      end

      context 'visiting blacklisted_me page' do
        before { visit user_path(blacklisted_me) }

        it { should_have_no_friend 'Blacklisted Me' }
      end
    end

    context 'friend_request_sent_to_him@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_him
        visit people_path
      end

      context 'visiting user1 page' do
        before { visit user_path(user1) }

        it { should_have_no_friend 'John Wick' }
      end

      context 'visiting stranger page' do
        before { visit user_path(stranger) }

        it { should_have_no_friend 'Stranger Public' }
      end

      context 'visiting stranger_protected page' do
        before { visit user_path(stranger_protected) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend page' do
        before { visit user_path(friend) }

        it { should_have_no_friend 'Friend Dude' }
      end

      context 'visiting friend_private page' do
        before { visit user_path(friend_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_him page' do
        before { visit user_path(friend_request_sent_to_him) }

        it { should_have_no_friend 'Outgoing Friend' }
      end

      context 'visiting friend_request_sent_to_him_private page' do
        before { visit user_path(friend_request_sent_to_him_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_me page' do
        before { visit user_path(friend_request_sent_to_me) }

        it { should_have_no_friend 'Incoming Friend' }
      end

      context 'visiting friend_request_sent_to_me_private page' do
        before { visit user_path(friend_request_sent_to_me_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting blacklisted page' do
        before { visit user_path(blacklisted) }

        it { should_have_no_friend 'Blacklisted Dude' }
      end

      context 'visiting blacklisted_me page' do
        before { visit user_path(blacklisted_me) }

        it { should_have_no_friend 'Blacklisted Me' }
      end

    end

    context 'friend_request_sent_to_him_private@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_him_private
        visit people_path
      end

      context 'visiting user1 page' do
        before { visit user_path(user1) }

        it { should_have_no_friend 'John Wick' }
      end

      context 'visiting stranger page' do
        before { visit user_path(stranger) }

        it { should_have_no_friend 'Stranger Public' }
      end

      context 'visiting stranger_protected page' do
        before { visit user_path(stranger_protected) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend page' do
        before { visit user_path(friend) }

        it { should_have_no_friend 'Friend Dude' }
      end

      context 'visiting friend_private page' do
        before { visit user_path(friend_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_him page' do
        before { visit user_path(friend_request_sent_to_him) }

        it { should_have_no_friend 'Outgoing Friend' }
      end

      context 'visiting friend_request_sent_to_him_private page' do
        before { visit user_path(friend_request_sent_to_him_private) }

        it { should_have_no_friend 'Outgoing FriendPrivate' }
      end

      context 'visiting friend_request_sent_to_me page' do
        before { visit user_path(friend_request_sent_to_me) }

        it { should_have_no_friend 'Incoming Friend' }
      end

      context 'visiting friend_request_sent_to_me_private page' do
        before { visit user_path(friend_request_sent_to_me_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting blacklisted page' do
        before { visit user_path(blacklisted) }

        it { should_have_no_friend 'Blacklisted Dude' }
      end

      context 'visiting blacklisted_me page' do
        before { visit user_path(blacklisted_me) }

        it { should_have_no_friend 'Blacklisted Me' }
      end

    end

    context 'friend_request_sent_to_me@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_me
      end

      context 'visiting user1 page' do
        before { visit user_path(user1) }

        it { should_have_no_friend 'John Wick' }
      end

      context 'visiting stranger page' do
        before { visit user_path(stranger) }

        it { should_have_no_friend 'Stranger Public' }
      end

      context 'visiting stranger_protected page' do
        before { visit user_path(stranger_protected) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend page' do
        before { visit user_path(friend) }

        it { should_have_no_friend 'Friend Dude' }
      end

      context 'visiting friend_private page' do
        before { visit user_path(friend_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_him page' do
        before { visit user_path(friend_request_sent_to_him) }

        it { should_have_no_friend 'Outgoing Friend' }
      end

      context 'visiting friend_request_sent_to_him_private page' do
        before { visit user_path(friend_request_sent_to_him_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_me page' do
        before { visit user_path(friend_request_sent_to_me) }

        it { should_have_no_friend 'Incoming Friend' }
      end

      context 'visiting friend_request_sent_to_me_private page' do
        before { visit user_path(friend_request_sent_to_me_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting blacklisted page' do
        before { visit user_path(blacklisted) }

        it { should_have_no_friend 'Blacklisted Dude' }
      end

      context 'visiting blacklisted_me page' do
        before { visit user_path(blacklisted_me) }

        it { should_have_no_friend 'Blacklisted Me' }
      end

    end

    context 'friend_request_sent_to_me_private@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_me_private
      end

      context 'visiting user1 page' do
        before { visit user_path(user1) }

        it { should_have_no_friend 'John Wick' }
      end

      context 'visiting stranger page' do
        before { visit user_path(stranger) }

        it { should_have_no_friend 'Stranger Public' }
      end

      context 'visiting stranger_protected page' do
        before { visit user_path(stranger_protected) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend page' do
        before { visit user_path(friend) }

        it { should_have_no_friend 'Friend Dude' }
      end

      context 'visiting friend_private page' do
        before { visit user_path(friend_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_him page' do
        before { visit user_path(friend_request_sent_to_him) }

        it { should_have_no_friend 'Outgoing Friend' }
      end

      context 'visiting friend_request_sent_to_him_private page' do
        before { visit user_path(friend_request_sent_to_him_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_me page' do
        before { visit user_path(friend_request_sent_to_me) }

        it { should_have_no_friend 'Incoming Friend' }
      end

      context 'visiting friend_request_sent_to_me_private page' do
        before { visit user_path(friend_request_sent_to_me_private) }

        it { should_have_no_friend 'Incoming FriendPrivate' }
      end

      context 'visiting blacklisted page' do
        before { visit user_path(blacklisted) }

        it { should_have_no_friend 'Blacklisted Dude' }
      end

      context 'visiting blacklisted_me page' do
        before { visit user_path(blacklisted_me) }

        it { should_have_no_friend 'Blacklisted Me' }
      end

    end

    context 'blacklisted@gmail.com signs in' do
      before do
        login_as blacklisted
      end

      context 'visiting user1 page' do
        before { visit user_path(user1) }

        it { should_have_no_friend 'John Wick' }
      end

      context 'visiting stranger page' do
        before { visit user_path(stranger) }

        it { should_have_no_friend 'Stranger Public' }
      end

      context 'visiting stranger_protected page' do
        before { visit user_path(stranger_protected) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend page' do
        before { visit user_path(friend) }

        it { should_have_no_friend 'Friend Dude' }
      end

      context 'visiting friend_private page' do
        before { visit user_path(friend_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_him page' do
        before { visit user_path(friend_request_sent_to_him) }

        it { should_have_no_friend 'Outgoing Friend' }
      end

      context 'visiting friend_request_sent_to_him_private page' do
        before { visit user_path(friend_request_sent_to_him_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_me page' do
        before { visit user_path(friend_request_sent_to_me) }

        it { should_have_no_friend 'Incoming Friend' }
      end

      context 'visiting friend_request_sent_to_me_private page' do
        before { visit user_path(friend_request_sent_to_me_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting blacklisted page' do
        before { visit user_path(blacklisted) }

        it { should_have_no_friend 'Blacklisted Dude' }
      end

      context 'visiting blacklisted_me page' do
        before { visit user_path(blacklisted_me) }

        it { should_have_no_friend 'Blacklisted Me' }
      end

    end

    context 'blacklisted_me@gmail.com signs in' do
      before do
        login_as blacklisted_me
      end

      context 'visiting user1 page' do
        before { visit user_path(user1) }

        it { should_have_no_friend 'John Wick' }
      end

      context 'visiting stranger page' do
        before { visit user_path(stranger) }

        it { should_have_no_friend 'Stranger Public' }
      end

      context 'visiting stranger_protected page' do
        before { visit user_path(stranger_protected) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend page' do
        before { visit user_path(friend) }

        it { should_have_no_friend 'Friend Dude' }
      end

      context 'visiting friend_private page' do
        before { visit user_path(friend_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_him page' do
        before { visit user_path(friend_request_sent_to_him) }

        it { should_have_no_friend 'Outgoing Friend' }
      end

      context 'visiting friend_request_sent_to_him_private page' do
        before { visit user_path(friend_request_sent_to_him_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting friend_request_sent_to_me page' do
        before { visit user_path(friend_request_sent_to_me) }

        it { should_have_no_friend 'Incoming Friend' }
      end

      context 'visiting friend_request_sent_to_me_private page' do
        before { visit user_path(friend_request_sent_to_me_private) }

        it { expect(page).to have_no_css('#friendsContainer') }
      end

      context 'visiting blacklisted page' do
        before { visit user_path(blacklisted) }

        it { should_have_no_friend 'Blacklisted Dude' }
      end

      context 'visiting blacklisted_me page' do
        before { visit user_path(blacklisted_me) }

        it { should_have_no_friend 'Blacklisted Me' }
      end
    end
  end
end


