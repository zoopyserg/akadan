require 'rails_helper'

RSpec.describe "/bookmarks", type: :request do
  let!(:user) { create :user }
  let!(:record) { create :record, user: user }

  context 'signed in' do
    before { sign_in user }

    describe "POST /create" do
      context "bookmark does not exist" do
        it "creates a new Bookmark" do
          expect {
            post record_bookmarks_url(record)
          }.to change(record.bookmarks, :count).by(1)
        end

        it "redirects to the created bookmark" do
          post record_bookmarks_url(record)
          expect(response).to redirect_to new_user_session_path
        end
      end

      context "bookmark exists" do
        let!(:bookmark) { create :bookmark, user: user, record: record }

        it "does not create a new Bookmark" do
          expect {
            post record_bookmarks_url(record)
          }.to change(Bookmark, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post record_bookmarks_url(record)
          expect(response).to redirect_to new_user_session_path
        end
      end
    end

    describe "DELETE /destroy" do
      let!(:bookmark) { create :bookmark, user: user, record: record }

      it "destroys the requested bookmark" do
        expect {
          delete record_bookmark_url(record, bookmark)
        }.to change(Bookmark, :count).by(-1)
      end

      it "redirects to the bookmarks list" do
        delete record_bookmark_url(record, bookmark)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context 'not signed in' do
    describe "POST /create" do
      context "bookmark does not exist" do
        it "creates a new Bookmark" do
          expect {
            post record_bookmarks_url(record)
          }.to change(record.bookmarks, :count).by(0)
        end

        it "redirects to the created bookmark" do
          post record_bookmarks_url(record)
          expect(response).to redirect_to new_user_session_path
        end
      end

      context "bookmark exists" do
        let!(:bookmark) { create :bookmark, user: user, record: record }

        it "does not create a new Bookmark" do
          expect {
            post record_bookmarks_url(record)
          }.to change(Bookmark, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post record_bookmarks_url(record)
          expect(response).to redirect_to new_user_session_path
        end
      end
    end

    describe "DELETE /destroy" do
      let!(:bookmark) { create :bookmark, user: user, record: record }

      it "destroys the requested bookmark" do
        expect {
          delete record_bookmark_url(record, bookmark)
        }.to change(Bookmark, :count).by(0)
      end

      it "redirects to the bookmarks list" do
        delete record_bookmark_url(record, bookmark)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
