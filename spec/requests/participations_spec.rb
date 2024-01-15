require 'rails_helper'

RSpec.describe "/participations", type: :request do
  let!(:user) { create :user }
  let!(:user2) { create :user }
  let!(:conversation) { create :conversation }
  let!(:participation) { create :participation, conversation: conversation, user: user }

  let(:valid_attributes) {
    attributes_for :participation, conversation: conversation, user_id: user2.id
  }

  let(:invalid_attributes) {
    attributes_for :participation, conversation: conversation, user_id: user.id # already in the conversation
  }

  context 'signed in' do
    before { sign_in user }

    describe "GET /index" do
      it "renders a successful response" do
        Participation.create! valid_attributes
        get conversation_participations_url(conversation)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_conversation_participation_url(conversation)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Participation" do
          expect {
            post conversation_participations_url(conversation), params: { participation: valid_attributes }
          }.to change(Participation, :count).by(1)
        end

        it "redirects to the created participation" do
          post conversation_participations_url(conversation), params: { participation: valid_attributes }
          expect(response).to redirect_to(conversation_participations_url(conversation))
        end
      end

      context "with invalid parameters" do
        it "creates a new Participation" do
          expect {
            post conversation_participations_url(conversation), params: { participation: invalid_attributes }
          }.to change(Participation, :count).by(0)
        end

        it "redirects to the created participation" do
          post conversation_participations_url(conversation), params: { participation: invalid_attributes }
          expect(response).to redirect_to(conversation_participations_url(conversation))
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested participation" do
        participation = Participation.create! valid_attributes
        expect {
          delete conversation_participation_url(conversation, participation)
        }.to change(Participation, :count).by(-1)
      end

      it "redirects to the participations list" do
        participation = Participation.create! valid_attributes
        delete conversation_participation_url(conversation, participation)
        expect(response).to redirect_to(conversation_participations_url(conversation))
      end
    end
  end

  context 'not signed in' do
    describe "GET /index" do
      it "renders a successful response" do
        Participation.create! valid_attributes
        get conversation_participations_url(conversation)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_conversation_participation_url(conversation)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Participation" do
          expect {
            post conversation_participations_url(conversation), params: { participation: valid_attributes }
          }.to change(Participation, :count).by(0)
        end

        it "redirects to the created participation" do
          post conversation_participations_url(conversation), params: { participation: valid_attributes }
          expect(response).to redirect_to new_user_session_path
        end
      end

      context "with invalid parameters" do
        it "does not create a new Participation" do
          expect {
            post conversation_participations_url(conversation), params: { participation: invalid_attributes }
          }.to change(Participation, :count).by(0)
        end

        it "redirects to the created participation" do
          post conversation_participations_url(conversation), params: { participation: invalid_attributes }
          expect(response).to redirect_to new_user_session_path
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested participation" do
        participation = Participation.create! valid_attributes
        expect {
          delete conversation_participation_url(conversation, participation)
        }.to change(Participation, :count).by(0)
      end

      it "redirects to the participations list" do
        participation = Participation.create! valid_attributes
        delete conversation_participation_url(conversation, participation)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
