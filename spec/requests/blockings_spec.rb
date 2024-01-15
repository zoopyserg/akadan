require 'rails_helper'

RSpec.describe "Blockings", type: :request do
  let!(:user) { create :user }
  let!(:blocked_user) { create :user }
  let!(:blocking) { create :blocking, user: user, blocked_user: blocked_user }

  context 'signed in' do
    before { sign_in user }

    describe "CREATE" do
      it "renders a successful response" do
        post blocked_user_blockings_path(blocked_user), params: { blocked_user_id: blocked_user.id }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "DELETE" do
      it "renders a successful response" do
        delete blocked_user_blocking_path(blocked_user, blocking), params: { blocked_user_id: blocked_user.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context 'not signed in' do
    describe "CREATE" do
      it "renders a successful response" do
        post blocked_user_blockings_path(blocked_user), params: { blocked_user_id: blocked_user.id }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "DELETE" do
      it "renders a successful response" do
        delete blocked_user_blocking_path(blocked_user, blocking), params: { blocked_user_id: blocked_user.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
