require 'rails_helper'

RSpec.describe "/friend_requests", type: :request do
  let!(:user) { create :user }
  let!(:friend) { create :user }

  context 'signed in' do
    before { sign_in user }

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new FriendRequest" do
          expect {
            post friend_friend_requests_url(friend)
          }.to change(user.friend_requests.where(friend: friend), :count).by(1)
        end

        it "redirects to the created friend_request" do
          post friend_friend_requests_url(friend)
          expect(response).to redirect_to(friends_path)
        end
      end
    end

    describe "POST /accept" do
      context "with valid parameters" do
        it "creates a new FriendRequest" do
          expect {
            post accept_friend_friend_requests_url(friend)
          }.to change(user.friend_requests.where(friend: friend), :count).by(1)
        end

        it "redirects to the created friend_request" do
          post accept_friend_friend_requests_url(friend)
          expect(response).to redirect_to(friends_path)
        end
      end
    end

    describe "DELETE /reject" do
      let!(:friend_request) { create :friend_request, user: friend, friend: user }

      context "with valid parameters" do
        it "creates a new FriendRequest" do
          expect {
            delete reject_friend_friend_requests_url(friend)
          }.to change(friend.friend_requests.where(friend: user), :count).by(-1)
        end

        it "redirects to the created friend_request" do
          delete reject_friend_friend_requests_url(friend)
          expect(response).to redirect_to(friends_path)
        end
      end
    end

    describe "DELETE /unfriend" do
      let!(:friend_request) { create :friend_request, user: user, friend: friend }

      context "with valid parameters" do
        it "creates a new FriendRequest" do
          expect {
            delete unfriend_friend_friend_requests_url(friend)
          }.to change(user.friend_requests.where(friend: friend), :count).by(-1)
        end

        it "redirects to the created friend_request" do
          delete unfriend_friend_friend_requests_url(friend)
          expect(response).to redirect_to(friends_path)
        end
      end
    end

  end

  context 'not signed in' do
    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new FriendRequest" do
          expect {
            post friend_friend_requests_url(friend)
          }.to change(user.friend_requests.where(friend: friend), :count).by(0)
        end

        it "redirects to the created friend_request" do
          post friend_friend_requests_url(friend)
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

    describe "POST /accept" do
      context "with valid parameters" do
        it "creates a new FriendRequest" do
          expect {
            post accept_friend_friend_requests_url(friend)
          }.to change(user.friend_requests.where(friend: friend), :count).by(0)
        end

        it "redirects to the created friend_request" do
          post accept_friend_friend_requests_url(friend)
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

    describe "DELETE /reject" do
      let!(:friend_request) { create :friend_request, user: friend, friend: user }

      context "with valid parameters" do
        it "creates a new FriendRequest" do
          expect {
            delete reject_friend_friend_requests_url(friend)
          }.to change(friend.friend_requests.where(friend: user), :count).by(0)
        end

        it "redirects to the created friend_request" do
          delete reject_friend_friend_requests_url(friend)
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

    describe "DELETE /unfriend" do
      let!(:friend_request) { create :friend_request, user: user, friend: friend }

      context "with valid parameters" do
        it "creates a new FriendRequest" do
          expect {
            delete unfriend_friend_friend_requests_url(friend)
          }.to change(user.friend_requests.where(friend: friend), :count).by(0)
        end

        it "redirects to the created friend_request" do
          delete unfriend_friend_friend_requests_url(friend)
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end
end
