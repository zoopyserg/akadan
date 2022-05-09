require 'rails_helper'

RSpec.feature "Records Index Create Subrecords Button", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free }
  let!(:user2) { create :user, :confirmed, :free }
  let!(:record_b) { create :record, :with_dot, name: 'Record B', user: user2, is_public: true }

  let!(:connection_type) { ConnectionType.solution_connection_type }

  context 'public someone elses record' do
    let!(:record) { create :record, :with_dot, name: 'Record A', user: user2, is_public: true }

    context 'not signed in' do
      describe 'a button' do
        before { visit user_path(user2) }

        it 'should have no button' do
          expect(page).to have_css "[href='#{new_record_connection_type_connection_path(record, connection_type)}']"
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
        login_as user1, scope: :user
        visit user_path(user2)
      end

      it 'should allow to edit' do
        expect(page).to have_css "[href='#{new_record_connection_type_connection_path(record, connection_type)}']"
      end

      # sometimes failes when there is a lot of records
      it 'should let me create subrecords' do
        find(:css, "[href='#{new_record_connection_type_connection_path(record, connection_type)}']").click

        expect{
          create_connection('some connection', 'description', connection_type.name, 'Record A', 'Record B')
        }.to change{
          record.children.count
        }.by(1)
      end
    end
  end

  context 'private my record' do
    let!(:record) { create :record, :with_dot, name: 'Record A', user: user1, is_public: false }

    before { Record.where.not(id: [record.id, record_b.id]).destroy_all }

    context 'not signed in' do
      describe 'a button' do
        before { visit user_path(user2) }

        it 'should have no button' do
          expect(page).to have_no_css "[href='#{new_record_connection_type_connection_path(record, connection_type)}']"
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
        login_as user1, scope: :user
        visit user_path(user1)
      end

      describe 'a button' do
        it 'should allow to edit' do
          expect(page).to have_css "[href='#{new_record_connection_type_connection_path(record, connection_type)}']"
        end

        # sometimes failes when there is a lot of records
        it 'should let me create subrecords' do
          find(:css, "[href='#{new_record_connection_type_connection_path(record, connection_type)}']").click

          expect{
            create_connection('some connection', 'description', connection_type.name, 'Record A', 'Record B')
          }.to change{
            record.children.count
          }.by(1)
        end
      end

      describe 'a path' do
        before { visit new_record_connection_type_connection_path(record, connection_type) }

        it 'should let me create subrecords' do
          expect{
            create_connection('some connection', 'description', connection_type.name, 'Record A', 'Record B')
          }.to change{
            record.children.count
          }.by(1)
        end
      end
    end
  end

  context 'private someone elses record' do
    let!(:record) { create :record, :with_dot, name: 'Record A', user: user2, is_public: false }

    context 'not signed in' do
      describe 'a button' do
        before { visit user_path(user2) }

        it 'should have no button' do
          expect(page).to have_no_css "[href='#{new_record_connection_type_connection_path(record, connection_type)}']"
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
        login_as user1, scope: :user
        visit user_path(user2)
      end

      describe 'a button' do
        before { visit user_path(user2) }

        it 'should have no button' do
          expect(page).to have_no_css "[href='#{new_record_connection_type_connection_path(record, connection_type)}']"
        end
      end

      describe 'a path authorization' do
        before { visit new_record_connection_type_connection_path(record, connection_type) }

        it 'should have no button' do
          expect(current_path).to eq records_path
        end
      end
    end
  end
end
