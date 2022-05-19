require 'rails_helper'

RSpec.feature "RecordsIndices", type: :feature do
  let!(:user1) { create :user, :confirmed }
  let!(:user2) { create :user, :confirmed }
  let!(:record) { create :record, user: user1, is_public: true, name: 'Main Record 1' }
  let!(:record2) { create :record, user: user2, is_public: true, name: 'Main Record 2' }

  let!(:public_record1) { create :record, :with_dot, name: 'Public Record 1', user: user1, is_public: true }
  let!(:public_record2) { create :record, :with_dot, name: 'Public Record 2', user: user2, is_public: true }
  let!(:private_record1) { create :record, :with_dot, name: 'Private Record 1', user: user1, is_public: false }
  let!(:private_record2) { create :record, :with_dot, name: 'Private Record 2', user: user2, is_public: false }

  let!(:connection1) { create :connection, record_a: record, record_b: public_record1 }
  let!(:connection2) { create :connection, record_a: record, record_b: public_record2 }
  let!(:connection3) { create :connection, record_a: record, record_b: private_record1 }
  let!(:connection4) { create :connection, record_a: record, record_b: private_record2 }

  let!(:invisible_public_record1) { create :record, :with_dot, name: 'Public Invisible Record 1', user: user1, is_public: true }
  let!(:invisible_public_record2) { create :record, :with_dot, name: 'Public Invisible Record 2', user: user2, is_public: true }
  let!(:invisible_private_record1) { create :record, :with_dot, name: 'Private Invisible Record 1', user: user1, is_public: false }
  let!(:invisible_private_record2) { create :record, :with_dot, name: 'Private Invisible Record 2', user: user2, is_public: false }

  let!(:invisible_connection1) { create :connection, record_a: record2, record_b: public_record1 }
  let!(:invisible_connection2) { create :connection, record_a: record2, record_b: public_record2 }
  let!(:invisible_connection3) { create :connection, record_a: record2, record_b: private_record1 }
  let!(:invisible_connection4) { create :connection, record_a: record2, record_b: private_record2 }

  context 'not signed in' do
    context 'user 1 path' do
      before do
        visit user_path(user1)
        check "group_record_a_ids_#{public_record1.id}"
        check "group_record_a_ids_#{invisible_public_record1.id}"
        click_on 'Actions on Selected Records'

        expect {
          click_on 'Group...'
        }.to change {
          Group.count
        }.by(0)
      end

      it { expect(current_path).to eq new_user_session_path }
    end

    context 'user 2 path' do
      before do
        visit user_path(user2)
        check "group_record_a_ids_#{public_record2.id}"
        check "group_record_a_ids_#{invisible_public_record2.id}"
        click_on 'Actions on Selected Records'

        expect {
          click_on 'Group...'
        }.to change {
          Group.count
        }.by(0)
      end

      it { expect(current_path).to eq new_user_session_path }
    end
  end

  context 'signed in user 1' do
    before { login_as user1 }

    context 'user 1 path' do
      before do
        visit user_path(user1)
        check "group_record_a_ids_#{public_record1.id}"
        check "group_record_a_ids_#{private_record1.id}"
        check "group_record_a_ids_#{invisible_public_record1.id}"
        check "group_record_a_ids_#{invisible_private_record1.id}"
        click_on 'Actions on Selected Records'

        expect {
          click_on 'Group...'
        }.to change {
          Group.count
        }.by(1)

        expect(current_path).to eq edit_group_path(Group.last)
      end

      it { expect(page).to have_no_content 'Main Record 1' }
      it { expect(page).to have_no_content 'Main Record 2' }
      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_no_content 'Public Record 2' }
      it { expect(page).to have_content 'Private Record 1' }
      it { expect(page).to have_no_content 'Private Record 2' }

      it { expect(page).to have_content 'Public Invisible Record 1' }
      it { expect(page).to have_no_content 'Public Invisible Record 2' }
      it { expect(page).to have_content 'Private Invisible Record 1' }
      it { expect(page).to have_no_content 'Private Invisible Record 2' }
    end

    context 'user 2 path' do
      before do
        visit user_path(user2)
        check "group_record_a_ids_#{public_record2.id}"
        check "group_record_a_ids_#{invisible_public_record2.id}"
        click_on 'Actions on Selected Records'

        expect {
          click_on 'Group...'
        }.to change {
          Group.count
        }.by(1)

        expect(current_path).to eq edit_group_path(Group.last)
      end

      it { expect(page).to have_no_content 'Main Record 1' }
      it { expect(page).to have_no_content 'Main Record 2' }
      it { expect(page).to have_no_content 'Public Record 1' }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_no_content 'Private Record 1' }
      it { expect(page).to have_no_content 'Private Record 2' }

      it { expect(page).to have_no_content 'Public Invisible Record 1' }
      it { expect(page).to have_content 'Public Invisible Record 2' }
      it { expect(page).to have_no_content 'Private Invisible Record 1' }
      it { expect(page).to have_no_content 'Private Invisible Record 2' }
    end
  end

  context 'signed in user 2' do
    before { login_as user2 }

    context 'user 1 path' do
      before do
        visit user_path(user1)
        check "group_record_a_ids_#{public_record1.id}"
        check "group_record_a_ids_#{invisible_public_record1.id}"
        click_on 'Actions on Selected Records'

        expect {
          click_on 'Group...'
        }.to change {
          Group.count
        }.by(1)

        expect(current_path).to eq edit_group_path(Group.last)
      end


      it { expect(page).to have_no_content 'Main Record 1' }
      it { expect(page).to have_no_content 'Main Record 2' }
      it { expect(page).to have_content 'Public Record 1' }
      it { expect(page).to have_no_content 'Public Record 2' }
      it { expect(page).to have_no_content 'Private Record 1' }
      it { expect(page).to have_no_content 'Private Record 2' }

      it { expect(page).to have_content 'Public Invisible Record 1' }
      it { expect(page).to have_no_content 'Public Invisible Record 2' }
      it { expect(page).to have_no_content 'Private Invisible Record 1' }
      it { expect(page).to have_no_content 'Private Invisible Record 2' }
    end

    context 'user 2 path' do
      before do
        visit user_path(user2)
        check "group_record_a_ids_#{public_record2.id}"
        check "group_record_a_ids_#{private_record2.id}"
        check "group_record_a_ids_#{invisible_public_record2.id}"
        check "group_record_a_ids_#{invisible_private_record2.id}"
        click_on 'Actions on Selected Records'

        expect {
          click_on 'Group...'
        }.to change {
          Group.count
        }.by(1)

        expect(current_path).to eq edit_group_path(Group.last)
      end

      it { expect(page).to have_no_content 'Main Record 1' }
      it { expect(page).to have_no_content 'Main Record 2' }
      it { expect(page).to have_no_content 'Public Record 1' }
      it { expect(page).to have_content 'Public Record 2' }
      it { expect(page).to have_no_content 'Private Record 1' }
      it { expect(page).to have_content 'Private Record 2' }

      it { expect(page).to have_no_content 'Public Invisible Record 1' }
      it { expect(page).to have_content 'Public Invisible Record 2' }
      it { expect(page).to have_no_content 'Private Invisible Record 1' }
      it { expect(page).to have_content 'Private Invisible Record 2' }
    end
  end
end
