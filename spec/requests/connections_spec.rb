 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/connections", type: :request do
  
  # Connection. As you add validations to Connection, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Connection.create! valid_attributes
      get connections_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      connection = Connection.create! valid_attributes
      get connection_url(connection)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_connection_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      connection = Connection.create! valid_attributes
      get edit_connection_url(connection)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Connection" do
        expect {
          post connections_url, params: { connection: valid_attributes }
        }.to change(Connection, :count).by(1)
      end

      it "redirects to the created connection" do
        post connections_url, params: { connection: valid_attributes }
        expect(response).to redirect_to(connection_url(Connection.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Connection" do
        expect {
          post connections_url, params: { connection: invalid_attributes }
        }.to change(Connection, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post connections_url, params: { connection: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested connection" do
        connection = Connection.create! valid_attributes
        patch connection_url(connection), params: { connection: new_attributes }
        connection.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the connection" do
        connection = Connection.create! valid_attributes
        patch connection_url(connection), params: { connection: new_attributes }
        connection.reload
        expect(response).to redirect_to(connection_url(connection))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        connection = Connection.create! valid_attributes
        patch connection_url(connection), params: { connection: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested connection" do
      connection = Connection.create! valid_attributes
      expect {
        delete connection_url(connection)
      }.to change(Connection, :count).by(-1)
    end

    it "redirects to the connections list" do
      connection = Connection.create! valid_attributes
      delete connection_url(connection)
      expect(response).to redirect_to(connections_url)
    end
  end
end
