require 'rails_helper'

RSpec.feature "People Index Block Button", type: :feature do
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

    it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']" }
    it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger.id)}']" }
    it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger_protected.id)}']" }
    it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']" }
    it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_private.id)}']" }
    it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him.id)}']" }
    it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him_private.id)}']" }
    it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me.id)}']" }
    it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me_private.id)}']" }
    it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted.id)}']" }
    it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted_me.id)}']" }
  end

  context 'signed in' do
    context 'I sign in' do
      before do
        visit root_path
        sign_in('me@gmail.com', 'rediculouslycomplexpassword54321')
        visit people_path
      end

      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger_protected.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted_me.id)}']" }

      describe 'blocking a friend' do
        it { expect{ find("[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']").click }.to change{ user1.blocked_users.count }.by(1) }
        it { expect{ find("[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']").click }.to change{ User.mutual_friends(user1).count }.by(-1) }
        it { expect{ find("[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']").click }.to change{ User.mutual_friends(friend).count }.by(-1) }

        describe 'changes in friends list' do
          before { find("[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']").click }

          it { expect(current_path).to eq friends_path }
          it { expect(page).to have_no_content 'Friend Dude' }
        end

        describe 'changes in blocked users list' do
          before { find("[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']").click }
          before { visit blocked_users_path }

          it { expect(page).to have_content 'Friend Dude' }
        end
      end
    end

    context 'stranger@gmail.com signs in' do
      before do
        visit root_path
        sign_in('stranger@gmail.com', 'rediculouslycomplexpassword54321')
        visit people_path
      end

      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger_protected.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted_me.id)}']" }
    end

    context 'stranger_protected@gmail.com signs in' do
      before do
        visit root_path
        sign_in('stranger_protected@gmail.com', 'rediculouslycomplexpassword54321')
        visit people_path
      end

      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger_protected.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted_me.id)}']" }
    end

    context 'friend@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend@gmail.com', 'rediculouslycomplexpassword54321')
        visit people_path
      end

      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted_me.id)}']" }

      describe 'blocking me (as a friend)' do
        it { expect{ find("[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']").click }.to change{ friend.blocked_users.count }.by(1) }
        it { expect{ find("[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']").click }.to change{ User.mutual_friends(user1).count }.by(-1) }
        it { expect{ find("[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']").click }.to change{ User.mutual_friends(friend).count }.by(-1) }

        describe 'changes in friends list' do
          before { find("[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']").click }

          it { expect(current_path).to eq friends_path }
          it { expect(page).to have_no_content 'John Wick' }
        end

        describe 'changes in blocked users list' do
          before { find("[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']").click }
          before { visit blocked_users_path }

          it { expect(page).to have_content 'John Wick' }
        end
      end
    end

    context 'friend_private@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_private@gmail.com', 'rediculouslycomplexpassword54321')
        visit people_path
      end

      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger_protected.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted_me.id)}']" }
    end

    context 'friend_request_sent_to_him@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_request_sent_to_him@gmail.com', 'rediculouslycomplexpassword54321')
        visit people_path
      end

      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger_protected.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted_me.id)}']" }
    end

    context 'friend_request_sent_to_him_private@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_request_sent_to_him_private@gmail.com', 'rediculouslycomplexpassword54321')
        visit people_path
      end

      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger_protected.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted_me.id)}']" }
    end

    context 'friend_request_sent_to_me@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_request_sent_to_me@gmail.com', 'rediculouslycomplexpassword54321')
        visit people_path
      end

      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger_protected.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted_me.id)}']" }
    end

    context 'friend_request_sent_to_me_private@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_request_sent_to_me_private@gmail.com', 'rediculouslycomplexpassword54321')
        visit people_path
      end

      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger_protected.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted_me.id)}']" }
    end

    context 'blacklisted@gmail.com signs in' do
      before do
        visit root_path
        sign_in('blacklisted@gmail.com', 'rediculouslycomplexpassword54321')
        visit people_path
      end

      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger_protected.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted_me.id)}']" }
    end

    context 'blacklisted_me@gmail.com signs in' do
      before do
        visit root_path
        sign_in('blacklisted_me@gmail.com', 'rediculouslycomplexpassword54321')
        visit people_path
      end

      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: user1.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: stranger_protected.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{blocked_user_blockings_path(blocked_user_id: blacklisted_me.id)}']" }
    end
  end
end

