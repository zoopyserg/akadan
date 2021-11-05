require 'rails_helper'

RSpec.feature "Record Type", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  let!(:main_record1) { create :record, user: user1, is_public: true }
  let!(:main_record2) { create :record, user: user1, is_public: true }

  let!(:record_type1) { create :record_type, name: 'Type 1', user: user1, is_public: true }
  let!(:record_type2) { create :record_type, name: 'Type 2', user: user1, is_public: false }
  let!(:record_type3) { create :record_type, name: 'Type 3', user: user2, is_public: true }
  let!(:record_type4) { create :record_type, name: 'Type 4', user: user2, is_public: false }

  let!(:record_type1_invisible) { create :record_type, name: 'Type 1 Invisible', user: user1, is_public: true }
  let!(:record_type2_invisible) { create :record_type, name: 'Type 2 Invisible', user: user1, is_public: false }
  let!(:record_type3_invisible) { create :record_type, name: 'Type 3 Invisible', user: user2, is_public: true }
  let!(:record_type4_invisible) { create :record_type, name: 'Type 4 Invisible', user: user2, is_public: false }

  let!(:record) { create :record, record_type: record_type, user: user1, is_public: true }
  let!(:record_invisible) { create :record, record_type: record_type_invisible, user: user1, is_public: true }

  let!(:connection1) { create :connection, record_a: main_record1, record_b: record, user: user1 }
  let!(:connection2) { create :connection, record_a: main_record2, record_b: record_invisible, user: user1 }

  context 'not signed in' do
    before { visit record_path(main_record1) }

    context 'public my type' do
      let(:record_type) { record_type1 }
      let(:record_type_invisible) { record_type1_invisible }

      it { expect(page).to have_content 'Type:Type 1' }
      it { expect(page).to have_no_content 'Type:Type 1 Invisible' }
    end

    context 'private my type' do
      let(:record_type) { record_type2 }
      let(:record_type_invisible) { record_type2_invisible }

      it { expect(page).to have_content 'Type:Type 2' }
      it { expect(page).to have_no_content 'Type:Type 2 Invisible' }
    end

    context 'public someone elses type' do
      let(:record_type) { record_type3 }
      let(:record_type_invisible) { record_type3_invisible }

      it { expect(page).to have_content 'Type:Type 3' }
      it { expect(page).to have_no_content 'Type:Type 3 Invisible' }
    end

    context 'private someone elses type' do
      let(:record_type) { record_type4 }
      let(:record_type_invisible) { record_type4_invisible }

      it { expect(page).to have_content 'Type:Type 4' }
      it { expect(page).to have_no_content 'Type:Type 4 Invisible' }
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('user1@gmail.com', 'rediculouslycomplexpassword54321')
      visit record_path(main_record1)
    end

    context 'public my type' do
      let(:record_type) { record_type1 }
      let(:record_type_invisible) { record_type1_invisible }

      it { expect(page).to have_content 'Type:Type 1' }
      it { expect(page).to have_no_content 'Type:Type 1 Invisible' }
    end

    context 'private my type' do
      let(:record_type) { record_type2 }
      let(:record_type_invisible) { record_type2_invisible }

      it { expect(page).to have_content 'Type:Type 2' }
      it { expect(page).to have_no_content 'Type:Type 2 Invisible' }
    end

    context 'public someone elses type' do
      let(:record_type) { record_type3 }
      let(:record_type_invisible) { record_type3_invisible }

      it { expect(page).to have_content 'Type:Type 3' }
      it { expect(page).to have_no_content 'Type:Type 3 Invisible' }
    end

    context 'private someone elses type' do
      let(:record_type) { record_type4 }
      let(:record_type_invisible) { record_type4_invisible }

      it { expect(page).to have_content 'Type:Type 4' }
      it { expect(page).to have_no_content 'Type:Type 4 Invisible' }
    end
  end
end
