require 'rails_helper'

RSpec.describe "ConversationStarts", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/conversation_starts/create"
      expect(response).to have_http_status(:success)
    end
  end

end
