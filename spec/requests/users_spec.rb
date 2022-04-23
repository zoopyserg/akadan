require 'rails_helper'

RSpec.describe "/users", type: :request do
  let!(:user) { create :user, first_name: 'Vasia', last_name: 'Pupkin' }

  let(:valid_attributes) {
    attributes_for :user
  }

  let(:invalid_attributes) {
    attributes_for :user, first_name: '', last_name: ''
  }

  context 'signed in' do
    before { sign_in user }

    describe "GET /show" do
      it "renders a successful response" do
        get user_url(user)
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "render a successful response" do
        get edit_user_url(user)
        expect(response).to be_successful
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          attributes_for :user, first_name: 'John', last_name: 'Black'
        }

        it "updates the requested user" do
          patch user_url(user), params: { user: new_attributes }
          user.reload
          expect(user.full_name).to eq 'John Black'
        end

        it "redirects to the user" do
          patch user_url(user), params: { user: new_attributes }
          user.reload
          expect(response).to redirect_to(user_url(user))
        end
      end

      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          patch user_url(user), params: { user: invalid_attributes }
          expect(response).to render_template :edit
        end
      end
    end
  end

  context 'not signed in' do
    describe "GET /show" do
      it "renders a successful response" do
        get user_url(user)
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "render a successful response" do
        get edit_user_url(user)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          attributes_for :user, first_name: 'John', last_name: 'Black'
        }

        it "updates the requested user" do
          patch user_url(user), params: { user: new_attributes }
          user.reload
          expect(user.full_name).to eq 'Vasia Pupkin'
        end

        it "redirects to the user" do
          patch user_url(user), params: { user: new_attributes }
          user.reload
          expect(response).to redirect_to new_user_session_path
        end
      end

      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          patch user_url(user), params: { user: invalid_attributes }
          expect(response).to redirect_to new_user_session_path
        end
      end
    end
  end
end
