require 'rails_helper'

RSpec.describe "/connections", type: :request do
  let!(:user) { create :user }
  let!(:record_a) { create :record, user: user }
  let!(:record_b) { create :record, user: user }
  let!(:connection_type) { create :connection_type, user: user }

  let(:valid_attributes) {
    attributes_for :connection, user: user, record_a_id: record_a.id, connection_type_id: connection_type.id, record_b_id: record_b.id, is_public: true
  }

  let(:invalid_attributes) {
    attributes_for :connection, user: user, record_a: record_a.id, connection_type: connection_type.id, record_b_id: nil, is_public: true
  }

  describe 'standalone' do
    context 'signed in' do
      before { sign_in user }

      describe "GET /index" do
        it "renders a successful response" do
          Connection.create! valid_attributes
          get connections_url
          expect(response).to be_successful
        end
      end
    end

    context 'not signed in' do
      describe "GET /index" do
        it "renders a successful response" do
          Connection.create! valid_attributes
          get connections_url
          expect(response).to be_successful
        end
      end
    end
  end

  describe 'under records/connection_types' do
    context 'signed in' do
      before { sign_in user }

      describe "GET /new" do
        it "renders a successful response" do
          get new_record_connection_type_connection_path(record_a, connection_type)
          expect(response).to be_successful
        end
      end

      describe "GET /edit" do
        it "render a successful response" do
          connection = Connection.create! valid_attributes
          get edit_record_connection_type_connection_path(record_a, connection_type, connection)
          expect(response).to be_successful
        end
      end

      describe "POST /create" do
        context "with valid parameters" do
          it "creates a new Connection" do
            expect {
              post record_connection_type_connections_path(record_a, connection_type), params: { connection: valid_attributes }
            }.to change(Connection, :count).by(1)
          end

          it "redirects to the created connection" do
            post record_connection_type_connections_path(record_a, connection_type), params: { connection: valid_attributes }
            expect(response).to redirect_to(connections_url)
          end
        end

        context "with invalid parameters" do
          it "does not create a new Connection" do
            expect {
              post record_connection_type_connections_path(record_a, connection_type), params: { connection: invalid_attributes }
            }.to change(Connection, :count).by(0)
          end

          it "renders a successful response (i.e. to display the 'new' template)" do
            post record_connection_type_connections_path(record_a, connection_type), params: { connection: invalid_attributes }
            expect(response).to render_template :new
          end
        end
      end

      describe "PATCH /update" do
        context "with valid parameters" do
          let!(:record_c) { create :record, user: user }

          let(:new_attributes) {
            attributes_for :connection, user: user, record_a: record_a, connection_type: connection_type, record_b_id: record_c.id
          }

          it "updates the requested connection" do
            connection = Connection.create! valid_attributes
            patch record_connection_type_connection_path(record_a, connection_type, connection), params: { connection: new_attributes }
            connection.reload
            expect(connection.record_b).to eq record_c
          end

          it "redirects to the connection" do
            connection = Connection.create! valid_attributes
            patch record_connection_type_connection_path(record_a, connection_type, connection), params: { connection: new_attributes }
            connection.reload
            expect(response).to redirect_to(connections_path)
          end
        end

        context "with invalid parameters" do
          it "renders a successful response (i.e. to display the 'edit' template)" do
            connection = Connection.create! valid_attributes
            patch record_connection_type_connection_path(record_a, connection_type, connection), params: { connection: invalid_attributes }
            expect(response).to render_template :edit
          end
        end
      end
    end

    context 'not signed in' do
      describe "GET /new" do
        it "renders a successful response" do
          get new_record_connection_type_connection_path(record_a, connection_type)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "GET /edit" do
        it "render a successful response" do
          connection = Connection.create! valid_attributes
          get edit_record_connection_type_connection_path(record_a, connection_type, connection)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "POST /create" do
        context "with valid parameters" do
          it "creates a new Connection" do
            expect {
              post record_connection_type_connections_path(record_a, connection_type), params: { connection: valid_attributes }
            }.to change(Connection, :count).by(0)
          end

          it "redirects to the created connection" do
            post record_connection_type_connections_path(record_a, connection_type), params: { connection: valid_attributes }
            expect(response).to redirect_to(new_user_session_path)
          end
        end

        context "with invalid parameters" do
          it "does not create a new Connection" do
            expect {
              post record_connection_type_connections_path(record_a, connection_type), params: { connection: invalid_attributes }
            }.to change(Connection, :count).by(0)
          end

          it "renders a successful response (i.e. to display the 'new' template)" do
            post record_connection_type_connections_path(record_a, connection_type), params: { connection: invalid_attributes }
            expect(response).to redirect_to(new_user_session_path)
          end
        end
      end

      describe "PATCH /update" do
        context "with valid parameters" do
          let!(:record_c) { create :record, user: user }

          let(:new_attributes) {
            attributes_for :connection, user: user, record_a: record_a, connection_type: connection_type, record_b_id: record_c.id
          }

          it "updates the requested connection" do
            connection = Connection.create! valid_attributes
            patch record_connection_type_connection_path(record_a, connection_type, connection), params: { connection: new_attributes }
            connection.reload
            expect(connection.record_b).to eq record_b
          end

          it "redirects to the connection" do
            connection = Connection.create! valid_attributes
            patch record_connection_type_connection_path(record_a, connection_type, connection), params: { connection: new_attributes }
            connection.reload
            expect(response).to redirect_to(new_user_session_path)
          end
        end

        context "with invalid parameters" do
          it "renders a successful response (i.e. to display the 'edit' template)" do
            connection = Connection.create! valid_attributes
            patch record_connection_type_connection_path(record_a, connection_type, connection), params: { connection: invalid_attributes }
            expect(response).to redirect_to(new_user_session_path)
          end
        end
      end

    end
  end
end
