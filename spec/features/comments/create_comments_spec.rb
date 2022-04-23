require 'rails_helper'

RSpec.feature "Create Records Comments", type: :feature do
  let!(:user1) { create(:user, first_name: 'John', last_name: 'Carter') }
  let!(:user2) { create(:user, first_name: 'John', last_name: 'Wick') }

  let!(:record) { create(:record, user: user1, is_public: true) }

  context "user logged in" do
    context 'user created record' do
      before { login_as(user1, scope: :user) }
      before { visit record_path(record) }
      before { fill_in 'comment_body', with: 'test comment' }
      before { click_on 'Comment' }
      before { expect(current_path).to eq(record_path(record)) }
      before { visit record_path(record) }

      it { expect_content_within_comments('test comment') }

      it { expect_content_within_comments('by:John Carter') }

      it { expect_no_content_within_comments('by:John Wick') }
    end

    context 'someone else created record' do
      before { login_as(user2, scope: :user) }
      before { visit record_path(record) }
      before { fill_in 'comment_body', with: 'test comment' }
      before { click_on 'Comment' }
      before { expect(current_path).to eq(record_path(record)) }
      before { visit record_path(record) }

      it { expect_content_within_comments('test comment') }

      it { expect_no_content_within_comments('by:John Carter') }

      it { expect_content_within_comments('by:John Wick') }
    end
  end

  context "user not logged in" do
    before { visit record_path(record) }
    before { fill_in 'comment_body', with: 'test comment' }
    before { click_on 'Comment' }

    describe 'suggest to sign in' do
      it { expect(current_path).to eq(new_user_session_path) }
    end

    describe 'should not store the comment' do
      before { visit record_path(record) }

      it { expect_no_content_within_comments('test comment') }
    end
  end
end
