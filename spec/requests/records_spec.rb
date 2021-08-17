require 'rails_helper'

RSpec.describe "/records", :records_index, type: :request do
  let!(:user) { create :user }
  let!(:record_type) { create :record_type, user: user }

  let(:valid_attributes) {
    attributes_for :record, name: 'name', record_type_id: record_type.id, is_public: true
  }

  let(:invalid_attributes) {
    attributes_for :record, name: '', record_type_id: record_type.id, is_public: true
  }

  context 'signed in' do
    before { sign_in user }

    describe "GET /index" do
      it "renders a successful response" do
        user.records.create! valid_attributes
        get records_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        record = user.records.create! valid_attributes
        get record_url(record)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_record_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "render a successful response" do
        record = user.records.create! valid_attributes
        get edit_record_url(record)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new user.records" do
          expect {
            post records_url, params: { record: valid_attributes }
          }.to change(user.records, :count).by(1)
        end

        it "redirects to the created record" do
          post records_url, params: { record: valid_attributes }
          expect(response).to redirect_to(record_url(user.records.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new user.records" do
          expect {
            post records_url, params: { record: invalid_attributes }
          }.to change(user.records, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post records_url, params: { record: invalid_attributes }
          expect(response).to render_template :new
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          attributes_for :record, name: 'new name', record_type_id: record_type.id
        }

        it "updates the requested record" do
          record = user.records.create! valid_attributes
          patch record_url(record), params: { record: new_attributes }
          record.reload
          expect(record.name).to eq 'new name'
        end

        it "redirects to the record" do
          record = user.records.create! valid_attributes
          patch record_url(record), params: { record: new_attributes }
          record.reload
          expect(response).to redirect_to(record_url(record))
        end
      end

      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          record = user.records.create! valid_attributes
          patch record_url(record), params: { record: invalid_attributes }
          expect(response).to render_template :edit
        end
      end
    end

  end

  context 'not signed in' do
    describe "GET /index" do
      it "renders a successful response" do
        user.records.create! valid_attributes
        get records_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        record = user.records.create! valid_attributes
        get record_url(record)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_record_url
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "GET /edit" do
      it "render a successful response" do
        record = user.records.create! valid_attributes
        get edit_record_url(record)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new user.records" do
          expect {
            post records_url, params: { record: valid_attributes }
          }.to change(user.records, :count).by(0)
        end

        it "redirects to the created record" do
          post records_url, params: { record: valid_attributes }
          expect(response).to redirect_to new_user_session_path
        end
      end

      context "with invalid parameters" do
        it "does not create a new user.records" do
          expect {
            post records_url, params: { record: invalid_attributes }
          }.to change(user.records, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post records_url, params: { record: invalid_attributes }
          expect(response).to redirect_to new_user_session_path
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          attributes_for :record, name: 'new name', record_type_id: record_type.id
        }

        it "updates the requested record" do
          record = user.records.create! valid_attributes
          patch record_url(record), params: { record: new_attributes }
          record.reload
          expect(record.name).to eq 'name'
        end

        it "redirects to the record" do
          record = user.records.create! valid_attributes
          patch record_url(record), params: { record: new_attributes }
          record.reload
          expect(response).to redirect_to new_user_session_path
        end
      end

      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          record = user.records.create! valid_attributes
          patch record_url(record), params: { record: invalid_attributes }
          expect(response).to redirect_to new_user_session_path
        end
      end
    end

  end
end
