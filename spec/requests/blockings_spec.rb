require 'rails_helper'

RSpec.describe "Blockings", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/blockings/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/blockings/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
