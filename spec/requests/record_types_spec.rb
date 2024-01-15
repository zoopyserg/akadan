require 'rails_helper'

RSpec.describe "/record_types", type: :request do
  let!(:user) { create :user }

  let(:valid_attributes) {
    attributes_for :record_type, user: user, name: 'present', is_public: true
  }

  let(:invalid_attributes) {
    attributes_for :record_type, user: user, name: '', is_public: true
  }

  context 'signed in' do
    before { sign_in user }

    describe 'valid attributes' do
      let!(:record_type) { create :record_type, user: user }

      describe "GET /index" do
        it "renders a successful response" do
          get record_types_url
          expect(response).to be_successful
        end
      end

      describe "GET /new" do
        it "renders a successful response" do
          get new_record_type_url
          expect(response).to be_successful
        end
      end

      describe "GET /edit" do
        it "render a successful response" do
          get edit_record_type_url(record_type)
          expect(response).to be_successful
        end
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new user.record_types" do
          expect {
            post record_types_url, params: { record_type: valid_attributes }
          }.to change(user.record_types, :count).by(1)
        end

        it "redirects to the created record_type" do
          post record_types_url, params: { record_type: valid_attributes }
          expect(response).to redirect_to(record_types_url)
        end
      end

      context "with invalid parameters" do
        it "does not create a new user.record_types" do
          expect {
            post record_types_url, params: { record_type: invalid_attributes }
          }.to change(user.record_types, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post record_types_url, params: { record_type: invalid_attributes }
          expect(response).to render_template :new
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          attributes_for :record_type, user: user, name: 'future'
        }

        it "updates the requested record_type" do
          record_type = user.record_types.create! valid_attributes
          patch record_type_url(record_type), params: { record_type: new_attributes }
          record_type.reload
          expect(record_type.name).to eq 'future'
        end

        it "redirects to the record_type" do
          record_type = user.record_types.create! valid_attributes
          patch record_type_url(record_type), params: { record_type: new_attributes }
          record_type.reload
          expect(response).to redirect_to(record_types_url)
        end
      end

      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          record_type = user.record_types.create! valid_attributes
          patch record_type_url(record_type), params: { record_type: invalid_attributes }
          expect(response).to render_template :edit
        end
      end
    end

  end

  context 'not signed in' do
    describe "GET /index" do
      it "renders a successful response" do
        user.record_types.create! valid_attributes
        get record_types_url
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_record_type_url
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET /edit" do
      it "render a successful response" do
        record_type = user.record_types.create! valid_attributes
        get edit_record_type_url(record_type)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new user.record_types" do
          expect {
            post record_types_url, params: { record_type: valid_attributes }
          }.to change(user.record_types, :count).by(0)
        end

        it "redirects to the created record_type" do
          post record_types_url, params: { record_type: valid_attributes }
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context "with invalid parameters" do
        it "does not create a new user.record_types" do
          expect {
            post record_types_url, params: { record_type: invalid_attributes }
          }.to change(user.record_types, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post record_types_url, params: { record_type: invalid_attributes }
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          attributes_for :record_type, user: user, name: 'future'
        }

        it "updates the requested record_type" do
          record_type = user.record_types.create! valid_attributes
          patch record_type_url(record_type), params: { record_type: new_attributes }
          record_type.reload
          expect(record_type.name).to eq 'present'
        end

        it "redirects to the record_type" do
          record_type = user.record_types.create! valid_attributes
          patch record_type_url(record_type), params: { record_type: new_attributes }
          record_type.reload
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          record_type = user.record_types.create! valid_attributes
          patch record_type_url(record_type), params: { record_type: invalid_attributes }
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

  end
end
