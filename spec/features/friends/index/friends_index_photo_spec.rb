require 'rails_helper'

RSpec.feature "Friends Index Photos", type: :feature do
  let!(:user1) do
    create :user, :confirmed, :free, username: 'something',
      first_name: 'John',
      last_name: 'Wick',
      avatar: open_image('me.jpg'),
      email: 'me@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:stranger) do
    create :user, :confirmed, :free, username: 'stranger',
      first_name: 'Stranger',
      last_name: 'Public',
      avatar: open_image('stranger.jpg'),
      email: 'stranger@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:stranger_protected) do
    create :user, :confirmed, :free, username: 'stranger_protected',
      first_name: 'Stranger',
      last_name: 'Protected',
      avatar: open_image('stranger_protected.jpg'),
      email: 'stranger_protected@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: false
  end

  let!(:friend) do
    create :user, :confirmed, :free, username: 'friend',
      first_name: 'Friend',
      last_name: 'Dude',
      avatar: open_image('friend.jpg'),
      email: 'friend@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:friend_private) do
    create :user, :confirmed, :free, username: 'friend_private',
      first_name: 'Friend',
      last_name: 'Private',
      avatar: open_image('friend_private.jpg'),
      email: 'friend_private@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: false
  end

  let!(:friend_request_sent_to_him) do
    create :user, :confirmed, :free, username: 'friend_request_sent_to_him',
      first_name: 'Outgoing',
      last_name: 'Friend',
      avatar: open_image('friend_request_sent_to_him.jpg'),
      email: 'friend_request_sent_to_him@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:friend_request_sent_to_him_private) do
    create :user, :confirmed, :free, username: 'friend_request_sent_to_him_private',
      first_name: 'Outgoing',
      last_name: 'FriendPrivate',
      avatar: open_image('friend_request_sent_to_him_private.jpg'),
      email: 'friend_request_sent_to_him_private@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: false
  end

  let!(:friend_request_sent_to_me) do
    create :user, :confirmed, :free, username: 'friend_request_sent_to_me',
      first_name: 'Incoming',
      last_name: 'Friend',
      avatar: open_image('friend_request_sent_to_m_e.jpg'),
      email: 'friend_request_sent_to_me@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:friend_request_sent_to_me_private) do
    create :user, :confirmed, :free, username: 'friend_request_sent_to_me_private',
      first_name: 'Incoming',
      last_name: 'FriendPrivate',
      avatar: open_image('friend_request_sent_to_me_private.jpg'),
      email: 'friend_request_sent_to_me_private@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: false
  end

  let!(:blacklisted) do
    create :user, :confirmed, :free, username: 'blacklisted',
      first_name: 'Blacklisted',
      last_name: 'Dude',
      avatar: open_image('blacklisted.jpg'),
      email: 'blacklisted@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:blacklisted_me) do
    create :user, :confirmed, :free, username: 'blacklisted_me',
      first_name: 'Blacklisted',
      last_name: 'Me',
      avatar: open_image('blacklisted_m_e.jpg'),
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
    before { visit friends_path }

    it { expect(current_path).to eq new_user_session_path }
  end

  context 'signed in' do
    context 'I sign in' do
      before do
        login_as user1
        visit friends_path
      end

      it do
        within '#friendsList' do
          expect(page).to have_no_css "img[src*='me.jpg']"
          expect(page).to have_no_css "img[src*='stranger.jpg']"
          expect(page).to have_no_css "img[src*='stranger_private.jpg']"
          expect(page).to have_css "img[src*='friend.jpg']"
          expect(page).to have_css "img[src*='friend_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him_private.jpg']"
          expect(page).to have_css "img[src*='friend_request_sent_to_m_e.jpg']"
          expect(page).to have_css "img[src*='friend_request_sent_to_me_private.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted_m_e.jpg']"
        end
      end
    end

    context 'stranger@gmail.com signs in' do
      before do
        login_as stranger
        visit friends_path
      end

      it do
        within '#friendsList' do
          expect(page).to have_no_css "img[src*='me.jpg']"
          expect(page).to have_no_css "img[src*='stranger.jpg']"
          expect(page).to have_no_css "img[src*='stranger_private.jpg']"
          expect(page).to have_no_css "img[src*='friend.jpg']"
          expect(page).to have_no_css "img[src*='friend_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_m_e.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_me_private.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted_m_e.jpg']"
        end
      end
    end

    context 'stranger_protected@gmail.com signs in' do
      before do
        login_as stranger_protected
        visit friends_path
      end

      it do
        within '#friendsList' do
          expect(page).to have_no_css "img[src*='me.jpg']"
          expect(page).to have_no_css "img[src*='stranger.jpg']"
          expect(page).to have_no_css "img[src*='stranger_private.jpg']"
          expect(page).to have_no_css "img[src*='friend.jpg']"
          expect(page).to have_no_css "img[src*='friend_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_m_e.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_me_private.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted_m_e.jpg']"
        end
      end
    end

    context 'friend@gmail.com signs in' do
      before do
        login_as friend
        visit friends_path
      end

      it do
        within '#friendsList' do
          expect(page).to have_css "img[src*='me.jpg']"
          expect(page).to have_no_css "img[src*='stranger.jpg']"
          expect(page).to have_no_css "img[src*='stranger_private.jpg']"
          expect(page).to have_no_css "img[src*='friend.jpg']"
          expect(page).to have_no_css "img[src*='friend_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_m_e.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_me_private.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted_m_e.jpg']"
        end
      end
    end

    context 'friend_private@gmail.com signs in' do
      before do
        login_as friend_private
        visit friends_path
      end

      it do
        within '#friendsList' do
          expect(page).to have_css "img[src*='me.jpg']"
          expect(page).to have_no_css "img[src*='stranger.jpg']"
          expect(page).to have_no_css "img[src*='stranger_private.jpg']"
          expect(page).to have_no_css "img[src*='friend.jpg']"
          expect(page).to have_no_css "img[src*='friend_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_m_e.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_me_private.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted_m_e.jpg']"
        end
      end
    end

    context 'friend_request_sent_to_him@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_him
        visit friends_path
      end

      it do
        within '#friendsList' do
          expect(page).to have_css "img[src*='me.jpg']"
          expect(page).to have_no_css "img[src*='stranger.jpg']"
          expect(page).to have_no_css "img[src*='stranger_private.jpg']"
          expect(page).to have_no_css "img[src*='friend.jpg']"
          expect(page).to have_no_css "img[src*='friend_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_m_e.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_me_private.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted_m_e.jpg']"
        end
      end
    end

    context 'friend_request_sent_to_him_private@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_him_private
        visit friends_path
      end

      it do
        within '#friendsList' do
          expect(page).to have_css "img[src*='me.jpg']"
          expect(page).to have_no_css "img[src*='stranger.jpg']"
          expect(page).to have_no_css "img[src*='stranger_private.jpg']"
          expect(page).to have_no_css "img[src*='friend.jpg']"
          expect(page).to have_no_css "img[src*='friend_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_m_e.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_me_private.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted_m_e.jpg']"
        end
      end
    end

    context 'friend_request_sent_to_me@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_me
        visit friends_path
      end

      it do
        within '#friendsList' do
          expect(page).to have_no_css "img[src*='me.jpg']"
          expect(page).to have_no_css "img[src*='stranger.jpg']"
          expect(page).to have_no_css "img[src*='stranger_private.jpg']"
          expect(page).to have_no_css "img[src*='friend.jpg']"
          expect(page).to have_no_css "img[src*='friend_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_m_e.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_me_private.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted_m_e.jpg']"
        end
      end
    end

    context 'friend_request_sent_to_me_private@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_me_private
        visit friends_path
      end

      it do
        within '#friendsList' do
          expect(page).to have_no_css "img[src*='me.jpg']"
          expect(page).to have_no_css "img[src*='stranger.jpg']"
          expect(page).to have_no_css "img[src*='stranger_private.jpg']"
          expect(page).to have_no_css "img[src*='friend.jpg']"
          expect(page).to have_no_css "img[src*='friend_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_m_e.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_me_private.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted_m_e.jpg']"
        end
      end
    end

    context 'blacklisted@gmail.com signs in' do
      before do
        login_as blacklisted
        visit friends_path
      end

      it do
        within '#friendsList' do
          expect(page).to have_no_css "img[src*='me.jpg']"
          expect(page).to have_no_css "img[src*='stranger.jpg']"
          expect(page).to have_no_css "img[src*='stranger_private.jpg']"
          expect(page).to have_no_css "img[src*='friend.jpg']"
          expect(page).to have_no_css "img[src*='friend_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_m_e.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_me_private.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted_m_e.jpg']"
        end
      end
    end

    context 'blacklisted_me@gmail.com signs in' do
      before do
        login_as blacklisted_me
        visit friends_path
      end

      it do
        within '#friendsList' do
          expect(page).to have_no_css "img[src*='me.jpg']"
          expect(page).to have_no_css "img[src*='stranger.jpg']"
          expect(page).to have_no_css "img[src*='stranger_private.jpg']"
          expect(page).to have_no_css "img[src*='friend.jpg']"
          expect(page).to have_no_css "img[src*='friend_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_him_private.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_m_e.jpg']"
          expect(page).to have_no_css "img[src*='friend_request_sent_to_me_private.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted.jpg']"
          expect(page).to have_no_css "img[src*='blacklisted_m_e.jpg']"
        end
      end
    end
  end
end

