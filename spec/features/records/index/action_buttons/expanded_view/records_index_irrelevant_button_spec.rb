require 'rails_helper'

RSpec.feature "Records Index Irrelevant Button", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, username: 'something1', email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, username: 'something2', email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:connection_type_for_other_buttons) { create :connection_type, name: 'Subsystem', is_public: true }
  let!(:other_record_type_for_other_buttons) { create :record_type, name: 'Subsystem', is_public: true }

  let!(:connection_type) { create :connection_type, name: 'Irrelevant Because...', is_public: true }

  context 'public someone elses record' do
    let!(:record) { create :record, :with_dot, name: 'Record B', user: user2, is_public: true }
    let!(:record2) { create :record, :with_dot, name: 'Record B', user: user2, is_public: true }

    context 'not signed in' do
      describe 'a button' do
        before { visit records_path }

        it 'should have no button' do
          expect(page).to have_no_link 'Irrelevant'
        end
      end

      describe 'a path authorization' do
        before { visit new_record_connection_type_connection_path(record, connection_type) }

        it 'should have no button' do
          expect(current_path).to eq new_user_session_path
        end
      end
    end

    context 'signed in' do
      before do
        login_as user1
        visit records_path
      end

      it 'should allow to edit' do
        expect(page).to have_link 'Irrelevant', count: 2
      end

      # sometimes failes when there is a lot of records
      it 'should let me create subrecords' do
        click_on 'Irrelevant', match: :first

        select 'Record B', from: 'connection_record_b_id'

        expect{
          click_on 'Create'
        }.to change{
          record.children.count
        }.by(1)
      end
    end
  end

  context 'private my record' do
    let!(:record) { create :record, :with_dot, name: 'Record B', user: user1, is_public: true }
    let!(:record2) { create :record, :with_dot, name: 'Record B', user: user1, is_public: true }

    context 'not signed in' do
      describe 'a button' do
        before { visit records_path }

        it 'should have no button' do
          expect(page).to have_no_link 'Irrelevant'
        end
      end

      describe 'a path authorization' do
        before { visit new_record_connection_type_connection_path(record, connection_type) }

        it 'should have no button' do
          expect(current_path).to eq new_user_session_path
        end
      end
    end

    context 'signed in' do
      before do
        login_as user1
        visit records_path
      end

      describe 'a button' do
        it 'should allow to edit' do
          expect(page).to have_link 'Irrelevant'
        end

        it 'should let me create subrecords' do
          click_on 'Irrelevant', match: :first

          select 'Record B', from: 'connection_record_b_id'

          expect{
            click_on 'Create'
          }.to change{
            record.children.count
          }.by(1)
        end
      end

      describe 'a path' do
        before { visit new_record_connection_type_connection_path(record, connection_type) }

        it 'should let me create subrecords' do
          select 'Record B', from: 'connection_record_b_id'

          expect{
            click_on 'Create'
          }.to change{
            record.children.count
          }.by(1)
        end
      end
    end
  end

  context 'private someone elses record' do
    let!(:record) { create :record, :with_dot, name: 'Record B', user: user2, is_public: false }
    let!(:record2) { create :record, :with_dot, name: 'Record B', user: user2, is_public: false }

    context 'not signed in' do
      describe 'a button' do
        before { visit records_path }

        it 'should have no button' do
          expect(page).to have_no_link 'Irrelevant'
        end
      end

      describe 'a path authorization' do
        before { visit new_record_connection_type_connection_path(record, connection_type) }

        it 'should have no button' do
          expect(current_path).to eq new_user_session_path
        end
      end
    end

    context 'signed in' do
      before do
        login_as user1
        visit records_path
      end

      describe 'a button' do
        before { visit records_path }

        it 'should have no button' do
          expect(page).to have_no_link 'Irrelevant'
        end
      end

      describe 'a path authorization' do
        before { visit new_record_connection_type_connection_path(record, connection_type) }

        it 'should have no button' do
          expect(current_path).to eq connections_path
        end
      end
    end
  end
end
