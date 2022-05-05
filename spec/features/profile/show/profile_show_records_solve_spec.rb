require 'rails_helper'

RSpec.feature "User Show Records Solve Button", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, username: 'something1', email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, username: 'something2', email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:connection_type_for_other_buttons1) { ConnectionType.find_by(name: 'Irrelevant Because...') }
  let!(:connection_type_for_other_buttons2) { ConnectionType.find_by(name: 'Subsystem') }
  let!(:record_type_for_other_buttons) { RecordType.find_by(name: 'Subsystem') }

  let!(:connection_type) { ConnectionType.find_by(name: 'Is Solved By...') }
  let!(:record_type) { RecordType.find_by(name: 'Solution') }

  let!(:record_solve_url) { new_record_connection_type_record_type_bulk_record_path(record_id: record.id, connection_type_id: connection_type.id, record_type_id: record_type.id) }

  context 'public someone elses record', :do_not_create_data do
    let!(:record) { create :record, :with_dot, user: user2, is_public: true }

    context 'not signed in' do
      describe 'a button' do
        before { visit user_path(user2) }

        it 'should have no button' do
          expect(page).to have_css "[href='#{record_solve_url}']"
        end
      end

      describe 'a path authorization' do
        before { visit record_solve_url }

        it 'should have no button' do
          expect(current_path).to eq new_user_session_path
        end
      end
    end

    context 'signed in user 1' do
      before do
        login_as user1
        visit user_path(user2)
      end

      it 'should allow to edit' do
        expect(page).to have_css "[href='#{record_solve_url}']"
      end

      # sometimes failes when there is a lot of records
      it 'should let me create subrecords' do
        find(:css, "[href='#{record_solve_url}']").click

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

    context 'signed in user 2' do
      before do
        login_as user2
        visit user_path(user2)
      end

      it 'should allow to edit' do
        expect(page).to have_css "[href='#{record_solve_url}']"
      end

      # sometimes failes when there is a lot of records
      it 'should let me create subrecords' do
        find(:css, "[href='#{record_solve_url}']").click

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
    let!(:record) { create :record, :with_dot, user: user2, is_public: false }

    context 'not signed in' do
      describe 'a button' do
        before { visit user_path(user2) }

        it 'should have no button' do
          expect(page).to have_no_css "[href='#{record_solve_url}']"
        end
      end

      describe 'a path authorization' do
        before { visit record_solve_url }

        it 'should have no button' do
          expect(current_path).to eq new_user_session_path
        end
      end
    end

    context 'signed in' do
      before do
        login_as user1
        visit user_path(user2)
      end

      describe 'a button' do
        it 'should allow to edit' do
          expect(page).to have_no_css "[href='#{record_solve_url}']"
        end
      end

      describe 'a path authorization' do
        before { visit record_solve_url }

        it 'should have no button' do
          expect(current_path).to eq records_path
        end
      end
    end
  end
end
