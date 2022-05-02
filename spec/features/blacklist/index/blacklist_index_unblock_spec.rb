require 'rails_helper'

RSpec.feature "Blacklist Index Unblock Button", type: :feature do
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
    before { visit blocked_users_path }

    it { expect(current_path).to eq new_user_session_path }
  end

  context 'signed in' do
    context 'I sign in' do
      before do
        login_as user1
        visit blocked_users_path
      end

      it { expect(page).to have_css "[href='#{blocked_user_blocking_path(blocked_user_id: blacklisted.id, id: blacklisted_connection.id)}']" }
      it { expect(page).to have_link 'Unblock', count: 1 }

      it do
        expect{
          click_on 'Unblock'
          page.driver.browser.switch_to.alert.accept
        }.to change{
          user1.blocked_users.count
        }.by(-1)
      end

      it do
        expect(page).to have_content 'Blacklisted Dude'
        click_on 'Unblock'
        page.driver.browser.switch_to.alert.accept
        visit blocked_users_path
        expect(page).to have_no_link 'Unblock'
        expect(page).to have_no_content 'Blacklisted Dude'
      end
    end

    context 'stranger@gmail.com signs in' do
      before do
        login_as stranger
        visit blocked_users_path
      end

      it { expect(page).to have_no_link 'Unblock' }
    end

    context 'stranger_protected@gmail.com signs in' do
      before do
        login_as stranger_protected
        visit blocked_users_path
      end

      it { expect(page).to have_no_link 'Unblock' }
    end

    context 'friend@gmail.com signs in' do
      before do
        login_as friend
        visit blocked_users_path
      end

      it { expect(page).to have_no_link 'Unblock' }
    end

    context 'friend_private@gmail.com signs in' do
      before do
        login_as friend_private
        visit blocked_users_path
      end

      it { expect(page).to have_no_link 'Unblock' }
    end

    context 'friend_request_sent_to_him@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_him
        visit blocked_users_path
      end

      it { expect(page).to have_no_link 'Unblock' }
    end

    context 'friend_request_sent_to_him_private@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_him_private
        visit blocked_users_path
      end

      it { expect(page).to have_no_link 'Unblock' }
    end

    context 'friend_request_sent_to_me@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_me
        visit blocked_users_path
      end

      it { expect(page).to have_no_link 'Unblock' }
    end

    context 'friend_request_sent_to_me_private@gmail.com signs in' do
      before do
        login_as friend_request_sent_to_me_private
        visit blocked_users_path
      end

      it { expect(page).to have_no_link 'Unblock' }
    end

    context 'blacklisted@gmail.com signs in' do
      before do
        login_as blacklisted
        visit blocked_users_path
      end

      it { expect(page).to have_no_link 'Unblock' }
    end

    context 'blacklisted_me@gmail.com signs in' do
      before do
        login_as blacklisted_me
        visit blocked_users_path
      end

      it { expect(page).to have_css "[href='#{blocked_user_blocking_path(blocked_user_id: user1.id, id: blacklisted_me_connection.id)}']" }
      it { expect(page).to have_link 'Unblock', count: 1 }

      it do
        expect{
          click_on 'Unblock'
          page.driver.browser.switch_to.alert.accept
        }.to change{
          blacklisted_me.blocked_users.count
        }.by(-1)
      end

      it do
        expect(page).to have_content 'John Wick'
        click_on 'Unblock'
        page.driver.browser.switch_to.alert.accept
        visit blocked_users_path
        expect(page).to have_no_link 'Unblock'
        expect(page).to have_no_content 'John Wick'
      end
    end
  end
end

