require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:user3) { create :user, :confirmed }
  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user2, is_public: true }
  let!(:public_record3) { create :record, :with_dot, name: 'Public Record 3', user: user3, is_public: true }

  let!(:design1) { create :design, user: user1, designable: public_record1, is_public: true }
  let!(:design2) { create :design, user: user2, designable: public_record2, is_public: false }

  let!(:column1) { create :column, design: design1 }
  let!(:column2) { create :column, design: design2 }

  context 'not signed in' do
    context 'public record 1' do
      before { visit record_path(public_record1) }

      it { expect(page).to have_css '.recordscolumn', count: 2 }
    end

    context 'public record 2' do
      before { visit record_path(public_record2) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'public record 3' do
      before { visit record_path(public_record3) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'records index' do
      before { visit records_path }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'user 1 path' do
      before { visit user_path(user1) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'user 2 path' do
      before { visit user_path(user2) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'user 3 path' do
      before { visit user_path(user3) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end
  end

  context 'signed in user 1' do
    before { login_as user1 }

    context 'public record 1' do
      before { visit record_path(public_record1) }

      it { expect(page).to have_css '.recordscolumn', count: 2 }
    end

    context 'public record 2' do
      before { visit record_path(public_record2) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'public record 3' do
      before { visit record_path(public_record3) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'records index' do
      before { visit records_path }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'user 1 path' do
      before { visit user_path(user1) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'user 2 path' do
      before { visit user_path(user2) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'user 3 path' do
      before { visit user_path(user3) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end
  end

  context 'signed in user 2' do
    before { login_as user2 }

    context 'public record 1' do
      before { visit record_path(public_record1) }

      it { expect(page).to have_css '.recordscolumn', count: 2 }
    end

    context 'public record 2' do
      before { visit record_path(public_record2) }

      it { expect(page).to have_css '.recordscolumn', count: 2 }
    end

    context 'public record 3' do
      before { visit record_path(public_record3) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'records index' do
      before { visit records_path }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'user 1 path' do
      before { visit user_path(user1) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'user 2 path' do
      before { visit user_path(user2) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'user 3 path' do
      before { visit user_path(user3) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end
  end

  context 'signed in user 3' do
    before { login_as user3 }

    context 'public record 1' do
      before { visit record_path(public_record1) }

      it { expect(page).to have_css '.recordscolumn', count: 2 }
    end

    context 'public record 2' do
      before { visit record_path(public_record2) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'public record 3' do
      before { visit record_path(public_record3) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'records index' do
      before { visit records_path }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'user 1 path' do
      before { visit user_path(user1) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'user 2 path' do
      before { visit user_path(user2) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end

    context 'user 3 path' do
      before { visit user_path(user3) }

      it { expect(page).to have_css '.recordscolumn', count: 1 }
    end
  end
end
