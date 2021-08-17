require 'rails_helper'

RSpec.describe "BulkRecords", type: :request do
  let!(:user) { create :user }
  let!(:record) { create :record, user: user }
  let!(:connection_type) { create :connection_type, user: user }
  let!(:record_type) { create :record_type, user: user }

  let(:valid_params) {
    {
      record_collection: {
        record_1_name: 'hi'
      }
    }
  }

  let(:invalid_params) {
    {
      record_collection: {
        nothing: nil
      }
    }
  }

  context 'signed in' do
    before { sign_in user }

    describe "GET /new" do
      it "returns http success" do
        get new_record_connection_type_record_type_bulk_record_path(record, connection_type, record_type)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /create" do
      context 'valid' do
        it "returns http success" do
          post record_connection_type_record_type_bulk_records_path(record, connection_type, record_type), params: valid_params
          expect(response).to have_http_status(:redirect)
        end
      end

      context 'invalid' do
        it "returns http success" do
          post record_connection_type_record_type_bulk_records_path(record, connection_type, record_type), params: invalid_params
          expect(response).to have_http_status(:redirect)
        end
      end
    end

  end

  context 'not signed in' do

    describe "GET /new" do
      it "returns http success" do
        get new_record_connection_type_record_type_bulk_record_path(record, connection_type, record_type)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET /create" do
      context 'valid' do
        it "returns http success" do
          post record_connection_type_record_type_bulk_records_path(record, connection_type, record_type), params: valid_params
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context 'invalid' do
        it "returns http success" do
          post record_connection_type_record_type_bulk_records_path(record, connection_type, record_type), params: invalid_params
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

  end
end
