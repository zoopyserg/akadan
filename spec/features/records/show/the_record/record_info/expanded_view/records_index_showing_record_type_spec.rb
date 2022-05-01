require 'rails_helper'

RSpec.feature "Record Type", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:record_type1) { create :record_type, name: 'Type 1', user: user1, is_public: true }
  let!(:record_type2) { create :record_type, name: 'Type 2', user: user1, is_public: false }
  let!(:record_type3) { create :record_type, name: 'Type 3', user: user2, is_public: true }
  let!(:record_type4) { create :record_type, name: 'Type 4', user: user2, is_public: false }

  let!(:record) { create :record, :with_dot, record_type: record_type, user: user1, is_public: true }

  context 'not signed in' do
    before { visit record_path(record) }

    context 'public my type' do
      let(:record_type) { record_type1 }

      it { expect(page).to have_content 'Type:Type 1' }
    end

    context 'private my type' do
      let(:record_type) { record_type2 }

      it { expect(page).to have_content 'Type:Type 2' }
    end

    context 'public someone elses type' do
      let(:record_type) { record_type3 }

      it { expect(page).to have_content 'Type:Type 3' }
    end

    context 'private someone elses type' do
      let(:record_type) { record_type4 }

      it { expect(page).to have_content 'Type:Type 4' }
    end
  end

  context 'signed in' do
    before do
      login_as user1
      visit record_path(record)
    end

    context 'public my type' do
      let(:record_type) { record_type1 }

      it { expect(page).to have_content 'Type:Type 1' }
    end

    context 'private my type' do
      let(:record_type) { record_type2 }

      it { expect(page).to have_content 'Type:Type 2' }
    end

    context 'public someone elses type' do
      let(:record_type) { record_type3 }

      it { expect(page).to have_content 'Type:Type 3' }
    end

    context 'private someone elses type' do
      let(:record_type) { record_type4 }

      it { expect(page).to have_content 'Type:Type 4' }
    end
  end
end
