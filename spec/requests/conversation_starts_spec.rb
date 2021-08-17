require 'rails_helper'

RSpec.describe "ConversationStarts", type: :request do
  let!(:user) { create :user }
  let!(:user2) { create :user }

  context 'signed in' do
    before { sign_in user }

    describe "POST /create" do
      context 'conversation not present before' do
        it "returns http success" do
          post person_conversation_starts_path(person_id: user2.id)
          conversation = Conversation.last
          expect(response).to redirect_to(conversation_messages_path(conversation))
        end

        it "creates conversation" do
          expect{
            post person_conversation_starts_path(person_id: user2.id)
          }.to change{
            Conversation.count
          }.by(1)
        end

        it "creates participation" do
          expect{
            post person_conversation_starts_path(person_id: user2.id)
          }.to change{
            Participation.where(user: user).count
          }.by(1)
        end

        it "creates participation" do
          expect{
            post person_conversation_starts_path(person_id: user2.id)
          }.to change{
            Participation.where(user: user2).count
          }.by(1)
        end
      end

      context 'conversation present before' do
        let!(:conversation) { create :conversation }
        let!(:participation) { create :participation, conversation: conversation, user: user }
        let!(:participation2) { create :participation, conversation: conversation, user: user2 }

        it "returns http success" do
          post person_conversation_starts_path(person_id: user2.id)
          conversation = Conversation.last
          expect(response).to redirect_to(conversation_messages_path(conversation))
        end

        it "creates conversation" do
          expect{
            post person_conversation_starts_path(person_id: user2.id)
          }.to change{
            Conversation.count
          }.by(0)
        end

        it "creates participation" do
          expect{
            post person_conversation_starts_path(person_id: user2.id)
          }.to change{
            Participation.where(user: user).count
          }.by(0)
        end

        it "creates participation" do
          expect{
            post person_conversation_starts_path(person_id: user2.id)
          }.to change{
            Participation.where(user: user2).count
          }.by(0)
        end
      end
    end
  end

  context 'not signed in' do
    describe "POST /create" do
      context 'conversation not present before' do
        it "returns http success" do
          post person_conversation_starts_path(person_id: user2.id)
          conversation = Conversation.last
          expect(response).to redirect_to(new_user_session_path)
        end

        it "creates conversation" do
          expect{
            post person_conversation_starts_path(person_id: user2.id)
          }.to change{
            Conversation.count
          }.by(0)
        end

        it "creates participation" do
          expect{
            post person_conversation_starts_path(person_id: user2.id)
          }.to change{
            Participation.where(user: user).count
          }.by(0)
        end

        it "creates participation" do
          expect{
            post person_conversation_starts_path(person_id: user2.id)
          }.to change{
            Participation.where(user: user2).count
          }.by(0)
        end
      end

      context 'conversation present before' do
        let!(:conversation) { create :conversation }
        let!(:participation) { create :participation, conversation: conversation, user: user }
        let!(:participation2) { create :participation, conversation: conversation, user: user2 }

        it "returns http success" do
          post person_conversation_starts_path(person_id: user2.id)
          conversation = Conversation.last
          expect(response).to redirect_to(new_user_session_path)
        end

        it "creates conversation" do
          expect{
            post person_conversation_starts_path(person_id: user2.id)
          }.to change{
            Conversation.count
          }.by(0)
        end

        it "creates participation" do
          expect{
            post person_conversation_starts_path(person_id: user2.id)
          }.to change{
            Participation.where(user: user).count
          }.by(0)
        end

        it "creates participation" do
          expect{
            post person_conversation_starts_path(person_id: user2.id)
          }.to change{
            Participation.where(user: user2).count
          }.by(0)
        end
      end
    end
  end

end
