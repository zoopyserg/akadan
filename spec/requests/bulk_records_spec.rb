require 'rails_helper'

RSpec.describe "BulkRecords", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/bulk_records/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/bulk_records/create"
      expect(response).to have_http_status(:success)
    end
  end

end
