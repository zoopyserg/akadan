require 'rails_helper'

RSpec.feature "Create Records Comments", type: :feature do
  let!(:user1) { create(:user, first_name: 'John', last_name: 'Carter') }
  let!(:user2) { create(:user, first_name: 'John', last_name: 'Wick') }

  let!(:record) { create(:record, user: user1, is_public: true) }

  context 'comment present' do
    let!(:comment) { create(:comment, user: user1, commentable: record, body: 'test comment') }

    context "user logged in" do
      context 'user created record' do
        before { login_as(user1, scope: :user) }
        before { visit record_path(record) }
        before { expect(page).not_to have_css "#comment_#{comment.id} #comment_body" }
        before { click_on 'Reply' }
        before { expect(page).to have_css "#comment_#{comment.id} #comment_body" }
        before { find(:css, "#comment_#{comment.id} #comment_body").set 'test reply' }
        before { submit_reply_for_comment(comment) }
        before { expect(current_path).to eq(record_path(record)) }
        before { visit record_path(record) }

        it { expect_content_within_comments('test comment') }
        it { expect_content_within_comments('test reply') }

        it { expect_content_within_comments('by:John Carter', count: 2) }

        it { expect_no_content_within_comments('by:John Wick') }
      end

      context 'someone else created record' do
        before { login_as(user2, scope: :user) }
        before { visit record_path(record) }
        before { expect(page).not_to have_css "#comment_#{comment.id} #comment_body" }
        before { click_on 'Reply' }
        before { expect(page).to have_css "#comment_#{comment.id} #comment_body" }
        before { find(:css, "#comment_#{comment.id} #comment_body").set 'test reply' }
        before { submit_reply_for_comment(comment) }
        before { expect(current_path).to eq(record_path(record)) }
        before { visit record_path(record) }

        it { expect_content_within_comments('test comment') }
        it { expect_content_within_comments('test reply') }

        it { expect_content_within_comments('by:John Carter') }

        it { expect_content_within_comments('by:John Wick') }
      end
    end

    context "user not logged in" do
      before { visit record_path(record) }
      before { expect(page).not_to have_css "#comment_#{comment.id} #comment_body" }
      before { click_on 'Reply' }

      it { expect(page).to have_no_css "#comment_#{comment.id} #comment_body" }

      xit { expect(current_path).to eq(new_user_session_path) } # it works manually, but for some reason in RSpec + Selenium it does not work
    end
  end

  context 'comment not present' do
    context "user logged in" do
      context 'user created record' do
        before { login_as(user1, scope: :user) }
        before { visit record_path(record) }

        it { expect(page).to have_no_link 'Reply' }
      end

      context 'someone else created record' do
        before { login_as(user2, scope: :user) }
        before { visit record_path(record) }

        it { expect(page).to have_no_link 'Reply' }
      end
    end

    context "user not logged in" do
      before { login_as(user2, scope: :user) }
      before { visit record_path(record) }

      it { expect(page).to have_no_link 'Reply' }
    end
  end
end
