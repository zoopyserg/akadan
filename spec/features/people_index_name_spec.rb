require 'rails_helper'

RSpec.feature "People Index Names", type: :feature do
  let!(:me) do
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

  let!(:friend_request_sent_to_him) do
    create :user, :confirmed, :free, username: 'friend_request_sent_to_him',
      first_name: 'Outgoing',
      last_name: 'Friend',
      email: 'friend_request_sent_to_him@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
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

  let!(:friendship_connection) { create :friendship, user_a: user1, user_b: friend }
  let!(:friend_request_sent) { create :friend_request, user_a: user1, user_b: friend_request_sent_to_him }
  let!(:friend_request_received) { create :friend_request, user_a: friend_request_sent_to_me, user_b: user1 }
  let!(:blacklisted_connection) { create :blacklist_connection, user_a: user1, user_b: blacklisted }
  let!(:blacklisted_me_connection) { create :blacklist_connection, user_a: blacklisted_me, user_b: user1 }

  context 'not signed in' do
    before { visit people_path }

    it { expect(page).to have_content 'John Wick' }
    it { expect(page).to have_content 'Stranger Public' }
    it { expect(page).to have_no_content 'Stranger Protected' }
    it { expect(page).to have_content 'Friend Dude' }
    it { expect(page).to have_content 'Outgoing Friend' }
    it { expect(page).to have_content 'Incoming Friend' }
    it { expect(page).to have_content 'Blacklisted Dude' }
    it { expect(page).to have_content 'Blacklisted Me' }
  end

  context 'signed in' do
    context 'I sign in' do
      before do
        visit root_path
        sign_in('me@gmail.com', 'rediculouslycomplexpassword54321')
        visit users_path
      end

      it { expect(page).to have_no_content 'John Wick' }
      it { expect(page).to have_content 'Stranger Public' }
      it { expect(page).to have_no_content 'Stranger Protected' }
      it { expect(page).to have_content 'Friend Dude' }
      it { expect(page).to have_content 'Outgoing Friend' }
      it { expect(page).to have_content 'Incoming Friend' }
      it { expect(page).to have_no_content 'Blacklisted Dude' }
      it { expect(page).to have_no_content 'Blacklisted Me' }
    end

    context 'my collaborator1 signs in' do
      before do
        visit root_path
        sign_in('collaborator1@gmail.com', 'rediculouslycomplexpassword54321')
        visit conversation_messages_path(conversation1)
      end
    end

    context 'my collaborator2 signs in' do
      before do
        visit root_path
        sign_in('collaborator2@gmail.com', 'rediculouslycomplexpassword54321')
        visit conversation_messages_path(conversation1)
      end
    end
  end
end

