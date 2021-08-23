require 'rails_helper'

RSpec.feature "Records Index Create Subrecords Button", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, username: 'something1', email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, username: 'something2', email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:connection_type_for_other_buttons) { create :connection_type, name: 'Irrelevant Because...', is_public: true }

  let!(:connection_type) { create :connection_type, name: 'Subsystem', is_public: true }
  let!(:record_type) { create :record_type, name: 'Subsystem', is_public: true }

  context 'public someone elses record' do
    let!(:record) { create :record, user: user2, is_public: true }

    context 'not signed in' do
      describe 'a button' do
        before { visit record_path(record) }

        it 'should have no button' do
          expect(page).to have_no_link 'Create / Connect Subrecords'
        end
      end

      describe 'a path authorization' do
        before { visit new_record_connection_type_record_type_bulk_record_path(record_id: record.id, connection_type_id: connection_type.id, record_type_id: record_type.id) }

        it 'should have no button' do
          expect(current_path).to eq new_user_session_path
        end
      end
    end

    context 'signed in' do
      before do
        visit root_path
        sign_in('user1@gmail.com', 'rediculouslycomplexpassword54321')
        visit record_path(record)
      end

      it 'should allow to edit' do
        expect(page).to have_link 'Create / Connect Subrecords'
      end

      # sometimes failes when there is a lot of records
      it 'should let me create subrecords' do
        click_on 'Create / Connect Subrecords'

        fill_in 'record_collection_record_1_name', with: 'one'
        fill_in 'record_collection_record_2_name', with: 'two'
        fill_in 'record_collection_record_3_name', with: 'three'
        fill_in 'record_collection_record_4_name', with: 'four'

        expect{
          click_on 'Create'
        }.to change{
          record.children.count
        }.by(4)
      end
    end
  end

  context 'private my record' do
    let!(:record) { create :record, user: user1, is_public: false }

    context 'not signed in' do
      describe 'a button' do
        before { visit record_path(record) }

        it 'should have no button' do
          expect(page).to have_no_link 'Create / Connect Subrecords'
        end
      end

      describe 'a path authorization' do
        before { visit new_record_connection_type_record_type_bulk_record_path(record_id: record.id, connection_type_id: connection_type.id, record_type_id: record_type.id) }

        it 'should have no button' do
          expect(current_path).to eq new_user_session_path
        end
      end
    end

    context 'signed in' do
      before do
        visit root_path
        sign_in('user1@gmail.com', 'rediculouslycomplexpassword54321')
        visit record_path(record)
      end

      describe 'a button' do
        it 'should allow to edit' do
          expect(page).to have_link 'Create / Connect Subrecords'
        end

        # sometimes failes when there is a lot of records
        it 'should let me create subrecords' do
          click_on 'Create / Connect Subrecords'

          fill_in 'Record #1', with: 'one'
          fill_in 'Record #2', with: 'two'
          fill_in 'Record #3', with: 'three'
          fill_in 'Record #4', with: 'four'

          expect{
            click_on 'Create'
          }.to change{
            record.children.count
          }.by(4)
        end
      end

      describe 'a path' do
        before { visit new_record_connection_type_record_type_bulk_record_path(record_id: record.id, connection_type_id: connection_type.id, record_type_id: record_type.id) }

        it 'should let me create subrecords' do
          fill_in 'Record #1', with: 'one'
          fill_in 'Record #2', with: 'two'
          fill_in 'Record #3', with: 'three'
          fill_in 'Record #4', with: 'four'

          expect{
            click_on 'Create'
          }.to change{
            record.children.count
          }.by(4)
        end
      end
    end
  end

  context 'private someone elses record' do
    let!(:record) { create :record, user: user2, is_public: false }

    context 'not signed in' do
      describe 'a button' do
        before { visit record_path(record) }

        it 'should have no button' do
          expect(page).to have_no_link 'Create / Connect Subrecords'
        end
      end

      describe 'a path authorization' do
        before { visit new_record_connection_type_record_type_bulk_record_path(record_id: record.id, connection_type_id: connection_type.id, record_type_id: record_type.id) }

        it 'should have no button' do
          expect(current_path).to eq new_user_session_path
        end
      end
    end

    context 'signed in' do
      before do
        visit root_path
        sign_in('user1@gmail.com', 'rediculouslycomplexpassword54321')
        visit record_path(record)
      end

      describe 'a button' do
        before { visit record_path(record) }

        it 'should have no button' do
          expect(page).to have_no_link 'Create / Connect Subrecords'
        end
      end

      describe 'a path authorization' do
        before { visit new_record_connection_type_record_type_bulk_record_path(record_id: record.id, connection_type_id: connection_type.id, record_type_id: record_type.id) }

        it 'should have no button' do
          expect(current_path).to eq records_path
        end
      end
    end
  end
end