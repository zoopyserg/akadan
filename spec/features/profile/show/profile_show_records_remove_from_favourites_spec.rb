require 'rails_helper'

RSpec.feature "User Show Records Repeat Button", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, username: 'something1', email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, username: 'something2', email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:connection_type_for_other_buttons1) { ConnectionType.find_by(name: 'Irrelevant Because...') }
  let!(:connection_type_for_other_buttons2) { ConnectionType.find_by(name: 'Subsystem') }
  let!(:record_type_for_other_buttons) { RecordType.find_by(name: 'Subsystem') }

  let!(:connection_type) { ConnectionType.find_by(name: 'Is Solved By...') }
  let!(:record_type) { RecordType.find_by(name: 'Solution') }

  let!(:record_bookmark_url) { record_bookmark_path(record_id: record.id, id: bookmark.id) }

  let!(:bookmark1) { create :bookmark, user: user1, record: record }
  let!(:bookmark2) { create :bookmark, user: user2, record: record }

  context 'public someone elses record', :do_not_create_data do
    let!(:record) { create :record, :with_dot, user: user2, is_public: true }

    context 'not signed in' do
      describe 'a button' do
        let(:bookmark) { bookmark1 }

        before { visit user_path(user2) }

        it 'should have no button' do
          expect(page).to have_no_css "[href='#{record_bookmark_url}']"
        end
      end
    end

    context 'signed in user 1' do
      let!(:bookmark) { bookmark1 }

      before do
        login_as user1
        visit user_path(user2)
      end

      it 'should allow to edit' do
        expect(page).to have_css "[href='#{record_bookmark_url}']"
      end

      # sometimes failes when there is a lot of records
      it 'should let me create subrecords' do
        find(:css, "[href='#{record_bookmark_url}']").click

        expect(current_path).to eq user_path(user2)
      end
    end

    context 'signed in user 2' do
      let!(:bookmark) { bookmark2 }

      before do
        login_as user2
        visit user_path(user2)
      end

      it 'should allow to edit' do
        expect(page).to have_css "[href='#{record_bookmark_url}']"
      end

      # sometimes failes when there is a lot of records
      it 'should let me create subrecords' do
        find(:css, "[href='#{record_bookmark_url}']").click

        expect(current_path).to eq user_path(user2)
        expect(page).to have_no_css "[href='#{record_bookmark_url}']"
      end
    end
  end

  context 'private my record' do
    let!(:record) { create :record, :with_dot, user: user2, is_public: false }

    context 'not signed in' do
      describe 'a button' do
        let(:bookmark) { bookmark1 }

        before { visit user_path(user2) }

        it 'should have no button' do
          expect(page).to have_no_css "[href='#{record_bookmark_url}']"
        end
      end
    end

    context 'signed in' do
      let!(:bookmark) { bookmark1 }

      before do
        login_as user1
        visit user_path(user2)
      end

      describe 'a button' do
        it 'should allow to edit' do
          expect(page).to have_no_css "[href='#{record_bookmark_url}']"
        end
      end
    end
  end
end
