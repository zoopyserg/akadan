require 'rails_helper'

RSpec.describe "/messages", type: :request do
  let!(:user) { create :user }
  let!(:conversation) { create :conversation }
  let!(:participation) { create :participation, conversation: conversation, user: user }

  let(:valid_submitted_attributes) {
    {
      body: 'one two three'
    }
  }

  let(:invalid_submitted_attributes) {
    {
      body: ''
    }
  }

  let(:valid_creation_attributes) {
    {
      body: 'one two three',
      sender: user
    }
  }

  let(:invalid_creation_attributes) {
    {
      body: '',
      sender: user
    }
  }

  context 'signed in' do
    before { sign_in user }

    describe "GET /index" do
      it "renders a successful response" do
        conversation.messages.create! valid_creation_attributes
        get conversation_messages_url(conversation)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new conversation.messages" do
          expect {
            post conversation_messages_url(conversation), params: { message: valid_submitted_attributes }
          }.to change(conversation.messages, :count).by(1)
        end

        it "redirects to the created message" do
          post conversation_messages_url(conversation), params: { message: valid_submitted_attributes }
          expect(response).to redirect_to(conversation_messages_url)
        end
      end

      context "with invalid parameters" do
        it "does not create a new conversation.messages" do
          expect {
            post conversation_messages_url(conversation), params: { message: invalid_submitted_attributes }
          }.to change(conversation.messages, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post conversation_messages_url(conversation), params: { message: invalid_submitted_attributes }
          expect(response).to redirect_to(conversation_messages_url)
        end
      end
    end

  end

  context 'not signed in' do
    describe "GET /index" do
      it "renders a successful response" do
        conversation.messages.create! valid_creation_attributes
        get conversation_messages_url(conversation)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new conversation.messages" do
          expect {
            post conversation_messages_url(conversation), params: { message: valid_submitted_attributes }
          }.to change(conversation.messages, :count).by(0)
        end

        it "redirects to the created message" do
          post conversation_messages_url(conversation), params: { message: valid_submitted_attributes }
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context "with invalid parameters" do
        it "does not create a new conversation.messages" do
          expect {
            post conversation_messages_url(conversation), params: { message: invalid_submitted_attributes }
          }.to change(conversation.messages, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post conversation_messages_url(conversation), params: { message: invalid_submitted_attributes }
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

  end
end
