require 'rails_helper'

RSpec.feature "Create Records Comments", type: :feature do
  let!(:user1) { create(:user, first_name: 'John', last_name: 'Carter') }
  let!(:user2) { create(:user, first_name: 'John', last_name: 'Wick') }

  let!(:record) { create(:record, user: user1, is_public: true) }
  let!(:comment) { create(:comment, user: user1, commentable: record) }

  let!(:vote) { create :vote, user: user1, votable: comment, vote_flag: true }

  context "user logged in" do
    context 'user created record' do
      before { login_as(user1, scope: :user) }
      before { visit record_path(record) }
      before { expect_comment_to_have_vote(comment, '1') }
      before { vote_comment_down(comment) }
      before { expect_comment_to_have_vote(comment, '-1') }
      before { visit record_path(record) }

      it { expect_comment_to_have_vote(comment, '-1') }
      it { expect(page).to have_css "#comment_#{comment.id} .fa-chevron-down.text-success" }
      it { expect(page).to have_no_css "#comment_#{comment.id} .fa-chevron-up.text-success" }
      it { expect(page).to have_css "#comment_#{comment.id} .fa-chevron-up" }

      context 'clicked twice' do
        before { expect_comment_to_have_vote(comment, '-1') }
        before { vote_comment_down(comment) }
        before { vote_comment_down(comment) }
        before { vote_comment_down(comment) }

        it { expect_comment_to_have_vote(comment, '-1') }
      end

      context 'another user' do
        before { logout }
        before { login_as(user2, scope: :user) }
        before { visit record_path(record) }

        it { expect_comment_to_have_vote(comment, '-1') }
        it { expect(page).to have_no_css "#comment_#{comment.id} .fa-chevron-down.text-success" }
        it { expect(page).to have_no_css "#comment_#{comment.id} .fa-chevron-up.text-success" }
        it { expect(page).to have_css "#comment_#{comment.id} .fa-chevron-up" }
        it { expect(page).to have_css "#comment_#{comment.id} .fa-chevron-down" }
      end

      context 'no user' do
        before { logout }
        before { visit record_path(record) }

        it { expect_comment_to_have_vote(comment, '-1') }
        it { expect(page).to have_no_css "#comment_#{comment.id} .fa-chevron-down.text-success" }
        it { expect(page).to have_no_css "#comment_#{comment.id} .fa-chevron-up.text-success" }
        it { expect(page).to have_css "#comment_#{comment.id} .fa-chevron-up" }
        it { expect(page).to have_css "#comment_#{comment.id} .fa-chevron-down" }
      end
    end

    context 'someone else created record' do
      before { login_as(user2, scope: :user) }
      before { visit record_path(record) }
      before { expect_comment_to_have_vote(comment, '1') }
      before { vote_comment_down(comment) }
      before { expect_comment_to_have_vote(comment, '0') }
      before { visit record_path(record) }

      it { expect_comment_to_have_vote(comment, '0') }
      it { expect(page).to have_css "#comment_#{comment.id} .fa-chevron-down.text-success" }
      it { expect(page).to have_no_css "#comment_#{comment.id} .fa-chevron-up.text-success" }
      it { expect(page).to have_css "#comment_#{comment.id} .fa-chevron-up" }

      context 'another user' do
        before { logout }
        before { login_as(user1, scope: :user) }
        before { visit record_path(record) }

        it { expect_comment_to_have_vote(comment, '0') }
        it { expect(page).to have_no_css "#comment_#{comment.id} .fa-chevron-down.text-success" }
        it { expect(page).to have_css "#comment_#{comment.id} .fa-chevron-up.text-success" }
        it { expect(page).to have_css "#comment_#{comment.id} .fa-chevron-up" }
        it { expect(page).to have_css "#comment_#{comment.id} .fa-chevron-down" }
      end

      context 'no user' do
        before { logout }
        before { visit record_path(record) }

        it { expect_comment_to_have_vote(comment, '0') }
        it { expect(page).to have_no_css "#comment_#{comment.id} .fa-chevron-down.text-success" }
        it { expect(page).to have_no_css "#comment_#{comment.id} .fa-chevron-up.text-success" }
        it { expect(page).to have_css "#comment_#{comment.id} .fa-chevron-up" }
        it { expect(page).to have_css "#comment_#{comment.id} .fa-chevron-down" }
      end
    end
  end

  context "user not logged in" do
    before { visit record_path(record) }
    before { expect_comment_to_have_vote(comment, '1') }
    before { vote_comment_down(comment) }
    before { visit record_path(record) } # for some reason this is the only way to trigger RSpec to navigate to JS redirect

    describe 'suggest to sign in' do
      it { expect(current_path).to eq(new_user_session_path) }
    end

    describe 'should not store the comment' do
      before { visit record_path(record) }
      before { visit record_path(record) }
      before { expect(current_path).to eq(record_path(record)) }

      it { expect_comment_to_have_vote(comment, '1') }
    end
  end
end
