require 'rails_helper'

RSpec.describe "/connection_types", type: :request do
  let!(:user) { create :user }

  let(:valid_attributes) {
    attributes_for :connection_type, user: user, name: 'valid name'
  }

  let(:invalid_attributes) {
    attributes_for :connection_type, name: '', user: user
  }

  describe 'standalone' do
    context 'signed in' do
      before { sign_in user }

      describe "GET /index" do
        let!(:connection_type) { create :connection_type, user: user }

        it "renders a successful response" do
          get connection_types_url
          expect(response).to be_successful
        end
      end

      describe "GET /new" do
        it "renders a successful response" do
          get new_connection_type_url
          expect(response).to be_successful
        end
      end

      describe "GET /edit" do
        let!(:connection_type) { create :connection_type, user: user }

        it "render a successful response" do
          get edit_connection_type_url(connection_type)
          expect(response).to be_successful
        end
      end

      describe "POST /create" do
        context "with valid parameters" do
          it "creates a new ConnectionType" do
            expect {
              post connection_types_url, params: { connection_type: valid_attributes }
            }.to change(ConnectionType, :count).by(1)
          end

          it "redirects to the created connection_type" do
            post connection_types_url, params: { connection_type: valid_attributes }
            expect(response).to redirect_to(connection_types_url)
          end
        end

        context "with invalid parameters" do
          it "does not create a new ConnectionType" do
            expect {
              post connection_types_url, params: { connection_type: invalid_attributes }
            }.to change(ConnectionType, :count).by(0)
          end

          it "renders a successful response (i.e. to display the 'new' template)" do
            post connection_types_url, params: { connection_type: invalid_attributes }
            expect(response).to render_template :new
          end
        end
      end

      describe "PATCH /update" do
        context "with valid parameters" do
          let(:new_attributes) {
            attributes_for :connection_type, name: 'b'
          }

          it "updates the requested connection_type" do
            connection_type = ConnectionType.create! valid_attributes
            patch connection_type_url(connection_type), params: { connection_type: new_attributes }
            connection_type.reload
            expect(connection_type.name).to eq 'b'
          end

          it "redirects to the connection_type" do
            connection_type = ConnectionType.create! valid_attributes
            patch connection_type_url(connection_type), params: { connection_type: new_attributes }
            connection_type.reload
            expect(response).to redirect_to(connection_types_url)
          end
        end

        context "with invalid parameters" do
          it "renders a successful response (i.e. to display the 'edit' template)" do
            connection_type = ConnectionType.create! valid_attributes
            patch connection_type_url(connection_type), params: { connection_type: invalid_attributes }
            expect(response).to render_template :edit
          end
        end
      end
    end

    context 'not signed in' do
      describe "GET /index" do
        let!(:connection_type) { create :connection_type, user: user }

        it "renders a successful response" do
          get connection_types_url
          expect(response).to be_successful
        end
      end

      describe "GET /new" do
        it "renders a successful response" do
          get new_connection_type_url
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "GET /edit" do
        let!(:connection_type) { create :connection_type, user: user }

        it "render a successful response" do
          get edit_connection_type_url(connection_type)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "POST /create" do
        context "with valid parameters" do
          it "creates a new ConnectionType" do
            expect {
              post connection_types_url, params: { connection_type: valid_attributes }
            }.to change(ConnectionType, :count).by(0)
          end

          it "redirects to the created connection_type" do
            post connection_types_url, params: { connection_type: valid_attributes }
            expect(response).to redirect_to(new_user_session_path)
          end
        end

        context "with invalid parameters" do
          it "does not create a new ConnectionType" do
            expect {
              post connection_types_url, params: { connection_type: invalid_attributes }
            }.to change(ConnectionType, :count).by(0)
          end

          it "renders a successful response (i.e. to display the 'new' template)" do
            post connection_types_url, params: { connection_type: invalid_attributes }
            expect(response).to redirect_to(new_user_session_path)
          end
        end
      end

      describe "PATCH /update" do
        context "with valid parameters" do
          let(:new_attributes) {
            attributes_for :connection_type, name: 'b'
          }

          it "updates the requested connection_type" do
            connection_type = ConnectionType.create! valid_attributes
            patch connection_type_url(connection_type), params: { connection_type: new_attributes }
            connection_type.reload
            expect(connection_type.name).to eq 'valid name'
          end

          it "redirects to the connection_type" do
            connection_type = ConnectionType.create! valid_attributes
            patch connection_type_url(connection_type), params: { connection_type: new_attributes }
            connection_type.reload
            expect(response).to redirect_to(new_user_session_path)
          end
        end

        context "with invalid parameters" do
          it "renders a successful response (i.e. to display the 'edit' template)" do
            connection_type = ConnectionType.create! valid_attributes
            patch connection_type_url(connection_type), params: { connection_type: invalid_attributes }
            expect(response).to redirect_to(new_user_session_path)
          end
        end
      end
    end
  end

  describe 'for records' do
    let!(:record) { create :record, user: user }

    context 'signed in' do
      before { sign_in user }

      describe "GET /index" do
        let!(:connection_type) { create :connection_type, user: user }

        it "renders a successful response" do
          get record_connection_types_url(record)
          expect(response).to be_successful
        end
      end

      describe "GET /show" do
        let!(:connection_type) { create :connection_type, user: user }

        it "renders a successful response" do
          get record_connection_type_url(record, connection_type)
          expect(response).to be_successful
        end
      end

      describe "GET /new" do
        it "renders a successful response" do
          get new_record_connection_type_url(record)
          expect(response).to be_successful
        end
      end

      describe "GET /edit" do
        let!(:connection_type) { create :connection_type, user: user }

        it "render a successful response" do
          get edit_record_connection_type_url(record, connection_type)
          expect(response).to be_successful
        end
      end

      describe "POST /create" do
        context "with valid parameters" do
          it "creates a new ConnectionType" do
            expect {
              post record_connection_types_url(record), params: { connection_type: valid_attributes }
            }.to change(ConnectionType, :count).by(1)
          end

          it "redirects to the created connection_type" do
            post record_connection_types_url(record), params: { connection_type: valid_attributes }
            expect(response).to redirect_to(connection_types_url)
          end
        end

        context "with invalid parameters" do
          it "does not create a new ConnectionType" do
            expect {
              post record_connection_types_url(record), params: { connection_type: invalid_attributes }
            }.to change(ConnectionType, :count).by(0)
          end

          it "renders a successful response (i.e. to display the 'new' template)" do
            post record_connection_types_url(record), params: { connection_type: invalid_attributes }
            expect(response).to render_template :new
          end
        end
      end

      describe "PATCH /update" do
        context "with valid parameters" do
          let(:new_attributes) {
            attributes_for :connection_type, name: 'b'
          }

          it "updates the requested connection_type" do
            connection_type = ConnectionType.create! valid_attributes
            patch record_connection_type_url(record, connection_type), params: { connection_type: new_attributes }
            connection_type.reload
            expect(connection_type.name).to eq 'b'
          end

          it "redirects to the connection_type" do
            connection_type = ConnectionType.create! valid_attributes
            patch record_connection_type_url(record, connection_type), params: { connection_type: new_attributes }
            connection_type.reload
            expect(response).to redirect_to(connection_types_url)
          end
        end

        context "with invalid parameters" do
          it "renders a successful response (i.e. to display the 'edit' template)" do
            connection_type = ConnectionType.create! valid_attributes
            patch record_connection_type_url(record, connection_type), params: { connection_type: invalid_attributes }
            expect(response).to render_template :edit
          end
        end
      end
    end

    context 'not signed in' do
      describe "GET /index" do
        let!(:connection_type) { create :connection_type, user: user }

        it "renders a successful response" do
          get record_connection_types_url(record)
          expect(response).to be_successful
        end
      end

      describe "GET /show" do
        let!(:connection_type) { create :connection_type, user: user }

        it "renders a successful response" do
          get record_connection_type_url(record, connection_type)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "GET /new" do
        it "renders a successful response" do
          get new_record_connection_type_url(record)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "GET /edit" do
        let!(:connection_type) { create :connection_type, user: user }

        it "render a successful response" do
          get edit_record_connection_type_url(record, connection_type)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "POST /create" do
        context "with valid parameters" do
          it "creates a new ConnectionType" do
            expect {
              post record_connection_types_url(record), params: { connection_type: valid_attributes }
            }.to change(ConnectionType, :count).by(0)
          end

          it "redirects to the created connection_type" do
            post record_connection_types_url(record), params: { connection_type: valid_attributes }
            expect(response).to redirect_to(new_user_session_path)
          end
        end

        context "with invalid parameters" do
          it "does not create a new ConnectionType" do
            expect {
              post record_connection_types_url(record), params: { connection_type: invalid_attributes }
            }.to change(ConnectionType, :count).by(0)
          end

          it "renders a successful response (i.e. to display the 'new' template)" do
            post record_connection_types_url(record), params: { connection_type: invalid_attributes }
            expect(response).to redirect_to(new_user_session_path)
          end
        end
      end

      describe "PATCH /update" do
        context "with valid parameters" do
          let(:new_attributes) {
            attributes_for :connection_type, name: 'b'
          }

          it "updates the requested connection_type" do
            connection_type = ConnectionType.create! valid_attributes
            patch connection_type_url(connection_type), params: { connection_type: new_attributes }
            connection_type.reload
            expect(connection_type.name).to eq 'valid name'
          end

          it "redirects to the connection_type" do
            connection_type = ConnectionType.create! valid_attributes
            patch connection_type_url(connection_type), params: { connection_type: new_attributes }
            connection_type.reload
            expect(response).to redirect_to(new_user_session_path)
          end
        end

        context "with invalid parameters" do
          it "renders a successful response (i.e. to display the 'edit' template)" do
            connection_type = ConnectionType.create! valid_attributes
            patch connection_type_url(connection_type), params: { connection_type: invalid_attributes }
            expect(response).to redirect_to(new_user_session_path)
          end
        end
      end
    end
  end
end

