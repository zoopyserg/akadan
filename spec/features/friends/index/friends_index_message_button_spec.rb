require 'rails_helper'

RSpec.feature "Friends Index Message Button", type: :feature do
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

  let!(:friend_without_one_to_one_without_group) do
    create :user, :confirmed, :free, username: 'friend_without_one_to_one_without_group',
      first_name: 'Friend',
      last_name: 'Dude',
      email: 'friend_without_one_to_one_without_group@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:friend_with_one_to_one_without_group) do
    create :user, :confirmed, :free, username: 'friend_with_one_to_one_without_group',
      first_name: 'Friend',
      last_name: 'Dude',
      email: 'friend_with_one_to_one_without_group@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:friend_without_one_to_one_with_group) do
    create :user, :confirmed, :free, username: 'friend_without_one_to_one_with_group',
      first_name: 'Friend',
      last_name: 'Dude',
      email: 'friend_without_one_to_one_with_group@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:friend_with_one_to_one_with_group) do
    create :user, :confirmed, :free, username: 'friend_with_one_to_one_with_group',
      first_name: 'Friend',
      last_name: 'Dude',
      email: 'friend_with_one_to_one_with_group@gmail.com',
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

  let!(:friend_request_9) { create :friend_request, user: user1, friend: friend_without_one_to_one_without_group }
  let!(:friend_request_10) { create :friend_request, user: friend_without_one_to_one_without_group, friend: user1 }

  let!(:friend_request_11) { create :friend_request, user: user1, friend: friend_with_one_to_one_without_group }
  let!(:friend_request_12) { create :friend_request, user: friend_with_one_to_one_without_group, friend: user1 }

  let!(:friend_request_13) { create :friend_request, user: user1, friend: friend_without_one_to_one_with_group }
  let!(:friend_request_14) { create :friend_request, user: friend_without_one_to_one_with_group, friend: user1 }

  let!(:friend_request_15) { create :friend_request, user: user1, friend: friend_with_one_to_one_with_group }
  let!(:friend_request_16) { create :friend_request, user: friend_with_one_to_one_with_group, friend: user1 }

  let!(:blacklisted_connection) { create :blocking, user: user1, blocked_user: blacklisted }
  let!(:blacklisted_me_connection) { create :blocking, user: blacklisted_me, blocked_user: user1 }

  let!(:one_on_one_conversation_1) { create :conversation }
  let!(:one_on_one_conversation_2) { create :conversation }
  let!(:group_conversation_1) { create :conversation }
  let!(:group_conversation_2) { create :conversation }

  let!(:participation1) { create :participation, user: user1, conversation: one_on_one_conversation_1 }
  let!(:participation2) { create :participation, user: user1, conversation: one_on_one_conversation_2 }
  let!(:participation3) { create :participation, user: user1, conversation: group_conversation_1 }
  let!(:participation4) { create :participation, user: user1, conversation: group_conversation_2 }

  let!(:participation5) { create :participation, user: friend_with_one_to_one_without_group, conversation: one_on_one_conversation_1 }
  let!(:participation6) { create :participation, user: friend_with_one_to_one_with_group, conversation: one_on_one_conversation_2 }
  let!(:participation7) { create :participation, user: friend_without_one_to_one_with_group, conversation: group_conversation_1 }
  let!(:participation8) { create :participation, user: friend_with_one_to_one_with_group, conversation: group_conversation_2 }

  let!(:participation9) { create :participation, user: friend, conversation: group_conversation_1 } # adding so that that group has 3 members
  let!(:participation10) { create :participation, user: friend, conversation: group_conversation_2 } # adding so that that group has 3 members

  context 'not signed in' do
    before { visit friends_path }

    it { expect(current_path).to eq new_user_session_path }
  end

  context 'signed in' do
    context 'I sign in' do
      before do
        visit root_path
        sign_in('me@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }

      describe 'starting a conversation with a friend with who I have no one on one and no group dialogs' do
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']").click }.to change{ Conversation.count }.by(1) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: user1.id }).count }.by(1) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: friend_without_one_to_one_without_group.id }).count }.by(1) }

        describe 'send a message' do
          before do
            find("[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']").click
            fill_in 'message_body', with: 'New Message Blah Blah good'
            click_on 'Send'
          end

          it 'should send the message to all the participants' do
            message = Message.where(body: 'New Message Blah Blah good').first
            user_ids = message.readings.pluck(:user_id)
            expect(user_ids).to include user1.id
            expect(user_ids).to include friend_without_one_to_one_without_group.id
          end
        end
      end

      describe 'starting a conversation with a friend with who I have one on one and no group dialogs' do
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']").click }.to change{ Conversation.count }.by(0) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: user1.id }).count }.by(0) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: friend_with_one_to_one_without_group.id }).count }.by(0) }

        describe 'send a message' do
          before do
            find("[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']").click
            fill_in 'message_body', with: 'New Message Blah Blah good'
            click_on 'Send'
          end

          it 'should send the message to all the participants' do
            message = Message.where(body: 'New Message Blah Blah good').first
            user_ids = message.readings.pluck(:user_id)
            expect(user_ids).to include user1.id
            expect(user_ids).to include friend_with_one_to_one_without_group.id
          end
        end
      end

      describe 'starting a conversation with a friend with who I have NO one on one but have group dialogs' do
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']").click }.to change{ Conversation.count }.by(1) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: user1.id }).count }.by(1) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: friend_without_one_to_one_with_group.id }).count }.by(1) }

        describe 'send a message' do
          before do
            find("[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']").click
            fill_in 'message_body', with: 'New Message Blah Blah good'
            click_on 'Send'
          end

          it 'should send the message to all the participants' do
            message = Message.where(body: 'New Message Blah Blah good').first
            user_ids = message.readings.pluck(:user_id)
            expect(user_ids).to include user1.id
            expect(user_ids).to include friend_without_one_to_one_with_group.id
          end
        end
      end

      describe 'starting a conversation with a friend with who I have one on one and have group dialogs' do
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']").click }.to change{ Conversation.count }.by(0) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: user1.id }).count }.by(0) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: friend_with_one_to_one_with_group.id }).count }.by(0) }

        describe 'send a message' do
          before do
            find("[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']").click
            fill_in 'message_body', with: 'New Message Blah Blah good'
            click_on 'Send'
          end

          it 'should send the message to all the participants' do
            message = Message.where(body: 'New Message Blah Blah good').first
            user_ids = message.readings.pluck(:user_id)
            expect(user_ids).to include user1.id
            expect(user_ids).to include friend_with_one_to_one_with_group.id
          end
        end
      end
    end

    context 'stranger@gmail.com signs in' do
      before do
        visit root_path
        sign_in('stranger@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }
    end

    context 'stranger_protected@gmail.com signs in' do
      before do
        visit root_path
        sign_in('stranger_protected@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }
    end

    context 'friend@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }
    end

    context 'friend_without_one_to_one_without_group@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_without_one_to_one_without_group@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }

      describe 'starting a conversation with user1' do
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click }.to change{ Conversation.count }.by(1) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: user1.id }).count }.by(1) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: friend_without_one_to_one_without_group.id }).count }.by(1) }

        describe 'send a message' do
          before do
            find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click
            fill_in 'message_body', with: 'New Message Blah Blah good'
            click_on 'Send'
          end

          it 'should send the message to all the participants' do
            message = Message.where(body: 'New Message Blah Blah good').first
            user_ids = message.readings.pluck(:user_id)
            expect(user_ids).to include user1.id
            expect(user_ids).to include friend_without_one_to_one_without_group.id
          end
        end
      end
    end

    context 'friend_with_one_to_one_without_group@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_with_one_to_one_without_group@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }

      describe 'starting a conversation with user1' do
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click }.to change{ Conversation.count }.by(0) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: user1.id }).count }.by(0) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: friend_with_one_to_one_without_group.id }).count }.by(0) }

        describe 'send a message' do
          before do
            find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click
            fill_in 'message_body', with: 'New Message Blah Blah good'
            click_on 'Send'
          end

          it 'should send the message to all the participants' do
            message = Message.where(body: 'New Message Blah Blah good').first
            user_ids = message.readings.pluck(:user_id)
            expect(user_ids).to include user1.id
            expect(user_ids).to include friend_with_one_to_one_without_group.id
          end
        end
      end
    end

    context 'friend_without_one_to_one_with_group@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_without_one_to_one_with_group@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }

      describe 'starting a conversation with user1' do
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click }.to change{ Conversation.count }.by(1) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: user1.id }).count }.by(1) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: friend_without_one_to_one_with_group.id }).count }.by(1) }

        describe 'send a message' do
          before do
            find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click
            fill_in 'message_body', with: 'New Message Blah Blah good'
            click_on 'Send'
          end

          it 'should send the message to all the participants' do
            message = Message.where(body: 'New Message Blah Blah good').first
            user_ids = message.readings.pluck(:user_id)
            expect(user_ids).to include user1.id
            expect(user_ids).to include friend_without_one_to_one_with_group.id
          end
        end
      end
    end

    context 'friend_with_one_to_one_with_group@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_with_one_to_one_with_group@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }

      describe 'starting a conversation with user1' do
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click }.to change{ Conversation.count }.by(0) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: user1.id }).count }.by(0) }
        it { expect{ find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click }.to change{ Conversation.joins(:users).where(users: { id: friend_with_one_to_one_with_group.id }).count }.by(0) }

        describe 'send a message' do
          before do
            find("[href='#{person_conversation_starts_path(person_id: user1.id)}']").click
            fill_in 'message_body', with: 'New Message Blah Blah good'
            click_on 'Send'
          end

          it 'should send the message to all the participants' do
            message = Message.where(body: 'New Message Blah Blah good').first
            user_ids = message.readings.pluck(:user_id)
            expect(user_ids).to include user1.id
            expect(user_ids).to include friend_with_one_to_one_with_group.id
          end
        end
      end
    end

    context 'friend_private@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_private@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }
    end

    context 'friend_request_sent_to_him@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_request_sent_to_him@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }
    end

    context 'friend_request_sent_to_him_private@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_request_sent_to_him_private@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }
    end

    context 'friend_request_sent_to_me@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_request_sent_to_me@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }
    end

    context 'friend_request_sent_to_me_private@gmail.com signs in' do
      before do
        visit root_path
        sign_in('friend_request_sent_to_me_private@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }
    end

    context 'blacklisted@gmail.com signs in' do
      before do
        visit root_path
        sign_in('blacklisted@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }
    end

    context 'blacklisted_me@gmail.com signs in' do
      before do
        visit root_path
        sign_in('blacklisted_me@gmail.com', 'rediculouslycomplexpassword54321')
        visit friends_path
      end

      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: user1.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: stranger_protected.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_without_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_without_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_with_one_to_one_with_group.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_him_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: friend_request_sent_to_me_private.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted.id)}']" }
      it { expect(page).to have_no_css "[href='#{person_conversation_starts_path(person_id: blacklisted_me.id)}']" }
    end
  end
end

