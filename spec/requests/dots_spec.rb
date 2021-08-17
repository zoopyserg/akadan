require 'rails_helper'

RSpec.describe "/dots", type: :request do
  let!(:user) { create :user }
  let!(:record) { create :record, user: user }
  let!(:project) { create :record, user: user }

  let(:valid_attributes) {
    attributes_for :dot, record: record,
                         project_id: project.id,
                         duration: 1234,
                         description: 'ni hao',
                         user: user
  }

  let(:invalid_attributes) {
    attributes_for :dot, record: record,
                         project_id: project.id,
                         duration: nil,
                         description: 'ni hao',
                         user: user
  }

  context 'signed in' do
    before { sign_in user }

    describe "GET /new" do
      it "renders a successful response" do
        get new_record_dot_url(record)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Dot" do
          expect {
            post record_dots_url(record), params: { dot: valid_attributes }
          }.to change(Dot, :count).by(1)
        end

        it "redirects to the created dot" do
          post record_dots_url(record), params: { dot: valid_attributes }
          expect(response).to redirect_to(record_path(record))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Dot" do
          expect {
            post record_dots_url(record), params: { dot: invalid_attributes }
          }.to change(record.dots, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post record_dots_url(record), params: { dot: invalid_attributes }
          expect(response).to render_template :new
        end
      end
    end
  end

  context 'not signed in' do
    describe "GET /new" do
      it "renders a successful response" do
        get new_record_dot_url(record)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Dot" do
          expect {
            post record_dots_url(record), params: { dot: valid_attributes }
          }.to change(record.dots, :count).by(0)
        end

        it "redirects to the created dot" do
          post record_dots_url(record), params: { dot: valid_attributes }
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context "with invalid parameters" do
        it "does not create a new Dot" do
          expect {
            post record_dots_url(record), params: { dot: invalid_attributes }
          }.to change(record.dots, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post record_dots_url(record), params: { dot: invalid_attributes }
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

  end
end
