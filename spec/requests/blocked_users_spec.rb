 require 'rails_helper'

RSpec.describe "/blocked_users", type: :request do
  let!(:user) { create :user }

  context 'signed in' do
    before { sign_in user }

    describe "GET /index" do
      it "renders a successful response" do
        get blocked_users_url
        expect(response).to be_successful
      end
    end
  end

  context 'not signed in' do
    describe "GET /index" do
      it "renders a successful response" do
        get blocked_users_url
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
