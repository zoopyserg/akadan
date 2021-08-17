require 'rails_helper'

RSpec.describe "/conversations", type: :request do
  let!(:user) { create :user }

  let(:valid_attributes) {
    {
    }
  }

  let(:invalid_attributes) {
    {
    }
  }

  context 'signed in' do
    before { sign_in user }

    describe "GET /index" do
      it "renders a successful response" do
        user.conversations.create! valid_attributes
        get conversations_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        conversation = user.conversations.create! valid_attributes
        get conversation_url(conversation)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_conversation_url
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new user.conversations" do
          expect {
            post conversations_url, params: { conversation: valid_attributes }
          }.to change(user.conversations, :count).by(1)
        end

        it "redirects to the created conversation" do
          post conversations_url, params: { conversation: valid_attributes }
          expect(response).to redirect_to(conversation_url(user.conversations.last))
        end
      end

      context "with invalid parameters" do
        # skipping (because there is no params)
      end
    end

  end
end
