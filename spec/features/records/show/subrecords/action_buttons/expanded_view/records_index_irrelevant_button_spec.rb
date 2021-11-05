require 'rails_helper'

RSpec.feature "Records Index Irrelevant Button", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, username: 'something1', email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, username: 'something2', email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:connection_type_for_other_buttons) { create :connection_type, name: 'Subsystem', is_public: true }
  let!(:other_record_type_for_other_buttons) { create :record_type, name: 'Subsystem', is_public: true }

  let!(:connection_type) { create :connection_type, name: 'Irrelevant Because...', is_public: true }

  let!(:main_record1) { create :record, user: user1, is_public: true }
  let!(:connection1) { create :connection, record_a: main_record1, record_b: record, user: user1 }
  let!(:connection2) { create :connection, record_a: main_record1, record_b: record2, user: user1 }

  context 'public someone elses record' do
    let!(:record) { create :record, name: 'Record B', user: user2, is_public: true }
    let!(:record2) { create :record, name: 'Record B', user: user2, is_public: true }

    context 'not signed in' do
      describe 'a button' do
        before { visit record_path(main_record1) }

        it 'should have no button' do
          within '.recordscolumn' do
            expect(page).to have_no_link 'Irrelevant'
          end
        end
      end
    end

    context 'signed in' do
      before do
        visit root_path
        sign_in('user1@gmail.com', 'rediculouslycomplexpassword54321')
        visit record_path(main_record1)
      end

      it 'should allow to edit' do
        within '.recordscolumn' do
          expect(page).to have_link 'Irrelevant', count: 2
        end
      end

      # sometimes failes when there is a lot of records
      it 'should let me create subrecords' do
        within '.recordscolumn' do
          click_on 'Irrelevant', match: :first
        end

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
    let!(:record) { create :record, name: 'Record B', user: user1, is_public: true }
    let!(:record2) { create :record, name: 'Record B', user: user1, is_public: true }

    context 'not signed in' do
      describe 'a button' do
        before { visit record_path(main_record1) }

        it 'should have no button' do
          within '.recordscolumn' do
            expect(page).to have_no_link 'Irrelevant'
          end
        end
      end
    end

    context 'signed in' do
      before do
        visit root_path
        sign_in('user1@gmail.com', 'rediculouslycomplexpassword54321')
        visit record_path(main_record1)
      end

      describe 'a button' do
        it 'should allow to edit' do
          within '.recordscolumn' do
            expect(page).to have_link 'Irrelevant'
          end
        end

        it 'should let me create subrecords' do
          within '.recordscolumn' do
            click_on 'Irrelevant', match: :first
          end

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
    let!(:record) { create :record, name: 'Record B', user: user2, is_public: false }
    let!(:record2) { create :record, name: 'Record B', user: user2, is_public: false }

    context 'not signed in' do
      describe 'a button' do
        before { visit record_path(main_record1) }

        it 'should have no button' do
          within '.recordscolumn' do
            expect(page).to have_no_link 'Irrelevant'
          end
        end
      end
    end

    context 'signed in' do
      before do
        visit root_path
        sign_in('user1@gmail.com', 'rediculouslycomplexpassword54321')
        visit record_path(main_record1)
      end

      describe 'a button' do
        before { visit record_path(main_record1) }

        it 'should have no button' do
          within '.recordscolumn' do
            expect(page).to have_no_link 'Irrelevant'
          end
        end
      end
    end
  end
end
