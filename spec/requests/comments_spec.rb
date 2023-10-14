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

RSpec.describe "/comments", type: :request do
  let!(:user) { create(:user) }
  let!(:record) { create(:record) }
  let!(:comment) { create(:comment, user: user, commentable: record) }

  # Comment. As you add validations to Comment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      body: 'my comment'
    }
  }

  let(:invalid_attributes) {
    {
      body: ''
    }
  }

  describe 'comments for records' do
    context 'signed in' do
      before { sign_in user }

      describe "GET /new" do
        it "renders a successful response" do
          get new_record_comment_url(record, format: :js)
          expect(response).to be_successful
        end

        it "renders a template" do
          get new_record_comment_url(record, format: :js)
          expect(response).to render_template(:new)
        end
      end

      describe "POST /create" do
        before { sign_in user }

        context "with valid parameters" do
          it "creates a new Comment" do
            expect {
              post record_comments_url(record, format: :js), params: { comment: valid_attributes }
            }.to change(record.comments, :count).by(1)
          end

          it "render comment" do
            post record_comments_url(record, format: :js), params: { comment: valid_attributes }
            expect(response).to render_template :show
          end
        end

        context "with invalid parameters" do
          it "does not create a new Comment" do
            expect {
              post record_comments_url(record, format: :js), params: { comment: invalid_attributes }
            }.to change(record.comments, :count).by(1)
          end

          it "renders a successful response (i.e. to display the 'new' template)" do
            post record_comments_url(record, format: :js), params: { comment: invalid_attributes }
            expect(response).to render_template :show
          end
        end
      end
    end

    context 'not signed in' do
      describe "GET /new" do
        it "renders a successful response" do
          get new_record_comment_url(record, format: :js)
          expect(response).to be_successful
        end

        it "renders a template" do
          get new_record_comment_url(record, format: :js)
          expect(response).to render_template('shared/redirect_to_login')
        end
      end

      describe "POST /create" do
        context "with valid parameters" do
          it "creates a new Comment" do
            expect {
              post record_comments_url(record, format: :js), params: { comment: valid_attributes }
            }.to change(record.comments, :count).by(0)
          end

          it "render comment" do
            post record_comments_url(record, format: :js), params: { comment: valid_attributes }
            expect(response.status).to eq 401
          end
        end

        context "with invalid parameters" do
          it "does not create a new Comment" do
            expect {
              post record_comments_url(record, format: :js), params: { comment: invalid_attributes }
            }.to change(record.comments, :count).by(0)
          end

          it "renders a successful response (i.e. to display the 'new' template)" do
            post record_comments_url(record, format: :js), params: { comment: invalid_attributes }
            expect(response.status).to eq 401
          end
        end
      end
    end
  end

  describe 'comments for other comments' do
    context 'signed in' do
      before { sign_in user }

      describe "GET /new" do
        it "renders a successful response" do
          get new_comment_comment_url(comment, format: :js)
          expect(response).to be_successful
        end

        it "renders a template" do
          get new_comment_comment_url(comment, format: :js)
          expect(response).to render_template(:new)
        end
      end

      describe "POST /create" do
        before { sign_in user }

        context "with valid parameters" do
          it "creates a new Comment" do
            expect {
              post comment_comments_url(comment, format: :js), params: { comment: valid_attributes }
            }.to change(comment.comments, :count).by(1)
          end

          it "render comment" do
            post comment_comments_url(comment, format: :js), params: { comment: valid_attributes }
            expect(response).to render_template :show
          end
        end

        context "with invalid parameters" do
          it "does not create a new Comment" do
            expect {
              post comment_comments_url(comment, format: :js), params: { comment: invalid_attributes }
            }.to change(comment.comments, :count).by(1)
          end

          it "renders a successful response (i.e. to display the 'new' template)" do
            post comment_comments_url(comment, format: :js), params: { comment: invalid_attributes }
            expect(response).to render_template :show
          end
        end
      end
    end

    context 'not signed in' do
      describe "GET /new" do
        it "renders a successful response" do
          get new_comment_comment_url(comment, format: :js)
          expect(response).to be_successful
        end

        it "renders a template" do
          get new_comment_comment_url(comment, format: :js)
          expect(response).to render_template('shared/redirect_to_login')
        end
      end

      describe "POST /create" do
        context "with valid parameters" do
          it "creates a new Comment" do
            expect {
              post comment_comments_url(comment, format: :js), params: { comment: valid_attributes }
            }.to change(comment.comments, :count).by(0)
          end

          it "render comment" do
            post comment_comments_url(comment, format: :js), params: { comment: valid_attributes }
            expect(response.status).to eq 401
          end
        end

        context "with invalid parameters" do
          it "does not create a new Comment" do
            expect {
              post comment_comments_url(comment, format: :js), params: { comment: invalid_attributes }
            }.to change(comment.comments, :count).by(0)
          end

          it "renders a successful response (i.e. to display the 'new' template)" do
            post comment_comments_url(comment, format: :js), params: { comment: invalid_attributes }
            expect(response.status).to eq 401
          end
        end
      end
    end
  end
end