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

RSpec.describe "/votes", type: :request do
  let!(:user) { create(:user) }
  let!(:comment) { create :comment }

  # Vote. As you add validations to Vote, be sure to
  # adjust the attributes here as well.
  let(:valid_up_attributes) {
    {
      vote_flag: 'true'
    }
  }

  let(:valid_down_attributes) {
    {
      vote_flag: 'false'
    }
  }

  let(:invalid_attributes) {
    {
      vote_flag: 'strange stuff'
    }
  }

  context 'not signed in' do
    describe 'POST /creates' do
      it 'does not change the votes' do
        expect {
          post comment_votes_url(comment, format: :js), params: valid_up_attributes
        }.to change(comment.votes.where(vote_flag: true), :count).by(0)
      end

      it 'does not change the votes' do
        expect {
          post comment_votes_url(comment, format: :js), params: valid_down_attributes
        }.to change(comment.votes.where(vote_flag: true), :count).by(0)
      end

      it 'does not change the votes' do
        post comment_votes_url(comment, format: :js), params: valid_down_attributes
        expect(response).to render_template 'shared/redirect_to_login'
      end
    end
  end

  context 'signed in' do
    before { sign_in user }

    describe "POST /create" do

      context "with valid parameters" do
        it "creates a new up Vote for comment" do
          expect {
            post comment_votes_url(comment, format: :js), params: valid_up_attributes
          }.to change(comment.votes.where(vote_flag: true), :count).by(1)
        end

        it "creates only one new up Vote for comment many vote requests" do
          expect {
            post comment_votes_url(comment, format: :js), params: valid_up_attributes
            post comment_votes_url(comment, format: :js), params: valid_up_attributes
            post comment_votes_url(comment, format: :js), params: valid_up_attributes
          }.to change(comment.votes.where(vote_flag: true), :count).by(1)
        end

        it "creates one new up Vote for user" do
          expect {
            post comment_votes_url(comment, format: :js), params: valid_up_attributes
          }.to change(user.votes.where(vote_flag: true), :count).by(1)
        end

        it "creates a new down Vote for comment" do
          expect {
            post comment_votes_url(comment, format: :js), params: valid_down_attributes
          }.to change(comment.votes.where(vote_flag: false), :count).by(1)
        end

        it "creates only one new down Vote for comment" do
          expect {
            post comment_votes_url(comment, format: :js), params: valid_down_attributes
            post comment_votes_url(comment, format: :js), params: valid_down_attributes
            post comment_votes_url(comment, format: :js), params: valid_down_attributes
          }.to change(comment.votes.where(vote_flag: false), :count).by(1)
        end

        it "creates switches the vote up and down" do
          expect {
            post comment_votes_url(comment, format: :js), params: valid_up_attributes
            post comment_votes_url(comment, format: :js), params: valid_down_attributes
            post comment_votes_url(comment, format: :js), params: valid_up_attributes
            post comment_votes_url(comment, format: :js), params: valid_down_attributes
          }.to change(comment.votes.where(vote_flag: false), :count).by(1)
        end

        it "creates a new down Vote for user" do
          expect {
            post comment_votes_url(comment, format: :js), params: valid_down_attributes
          }.to change(user.votes.where(vote_flag: false), :count).by(1)
        end

        it "redirects to the created vote" do
          post comment_votes_url(comment, format: :js), params: valid_up_attributes
          expect(response).to render_template :up
        end
      end

      context "with invalid parameters" do
        it "does not create a new Vote" do
          expect {
            post comment_votes_url(comment, format: :js), params: invalid_attributes
          }.to change(comment.votes.where(vote_flag: true), :count).by(1)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post comment_votes_url(comment, format: :js), params: invalid_attributes
          expect(response).to be_successful
        end
      end
    end
  end
end
