require 'rails_helper'

RSpec.feature "Decising which records to show", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, username: 'something1', email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, username: 'something2', email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  let!(:connection_type) { create :connection_type, name: 'Subsystem', is_public: true }
  let!(:record_type) { create :record_type, name: 'Subsystem', is_public: true }

  context 'showing only records of specific type' do
    let!(:record_type1) { create :record_type, name: 'Record Type 1', user: user2, is_public: true }
    let!(:record_type2) { create :record_type, name: 'Record Type 2', user: user2, is_public: true }

    let!(:record1) { create :record, name: 'Record 1', record_type: record_type1, user: user2, is_public: true }
    let!(:record2) { create :record, name: 'Record 2', record_type: record_type2, user: user2, is_public: true }
    let!(:record3) { create :record, name: 'Record 3', record_type: record_type1, user: user2, is_public: false }
    let!(:record4) { create :record, name: 'Record 4', record_type: record_type2, user: user2, is_public: false }

    let!(:solution_connection_type) { ConnectionType.where(name: 'Is Solved By...').first }

    let!(:solution1) { create :record, name: 'Solution 1', user: user2 }
    let!(:solution2) { create :record, name: 'Solution 2', user: user2 }

    let!(:connection1) { create :connection, record_a: record2, record_b: solution1, user: user2, connection_type_id: solution_connection_type.id }
    let!(:connection2) { create :connection, record_a: record4, record_b: solution2, user: user2, connection_type_id: solution_connection_type.id }

    describe 'raw URL visit' do
      context 'record type 1' do
        context 'not signed in' do
          before { visit "/records?record_type_id=#{record_type1.id}" }

          it 'should have no button' do
            expect(page).to have_content 'Record 1'
            expect(page).to have_no_content 'Record 2'
            expect(page).to have_no_content 'Record 3'
            expect(page).to have_no_content 'Record 4'
          end
        end

        context 'signed in' do
          before do
            visit connection_types_path
            sign_in('user2@gmail.com', 'rediculouslycomplexpassword54321')
            visit "/records?record_type_id=#{record_type1.id}"
          end

          it 'should have all' do
            expect(page).to have_content 'Record 1'
            expect(page).to have_no_content 'Record 2'
            expect(page).to have_content 'Record 3'
            expect(page).to have_no_content 'Record 4'
          end
        end
      end

      context 'record type 2' do
        context 'not signed in' do
          before { visit "/records?record_type_id=#{record_type2.id}" }

          it 'should have no button' do
            expect(page).to have_no_content 'Record 1'
            expect(page).to have_content 'Record 2'
            expect(page).to have_no_content 'Record 3'
            expect(page).to have_no_content 'Record 4'
          end
        end

        context 'signed in' do
          before do
            visit connection_types_path
            sign_in('user2@gmail.com', 'rediculouslycomplexpassword54321')
            visit "/records?record_type_id=#{record_type2.id}"
          end

          it 'should have all' do
            expect(page).to have_no_content 'Record 1'
            expect(page).to have_content 'Record 2'
            expect(page).to have_no_content 'Record 3'
            expect(page).to have_content 'Record 4'
          end
        end
      end

      context 'record type invalid' do
        context 'not signed in' do
          before { visit "/records?record_type_id=999999" }

          it 'should have no button' do
            expect(page).to have_no_content 'Record 1'
            expect(page).to have_no_content 'Record 2'
            expect(page).to have_no_content 'Record 3'
            expect(page).to have_no_content 'Record 4'
          end
        end

        context 'signed in' do
          before do
            visit connection_types_path
            sign_in('user2@gmail.com', 'rediculouslycomplexpassword54321')
            visit "/records?record_type_id=999999"
          end

          it 'should have all' do
            expect(page).to have_no_content 'Record 1'
            expect(page).to have_no_content 'Record 2'
            expect(page).to have_no_content 'Record 3'
            expect(page).to have_no_content 'Record 4'
          end
        end
      end
    end

    describe 'through filter form' do
      context 'record type 1' do
        context 'not signed in' do
          before do
            visit '/records'
            select 'Record Type 1', from: 'Record Type'
            within '.recordscolumn form' do
              click_on 'Show'
            end
          end

          it 'should have no button' do
            expect(page).to have_content 'Record 1'
            expect(page).to have_no_content 'Record 2'
            expect(page).to have_no_content 'Record 3'
            expect(page).to have_no_content 'Record 4'
          end
        end

        context 'signed in' do
          before do
            visit connection_types_path
            sign_in('user2@gmail.com', 'rediculouslycomplexpassword54321')
            visit '/records'
            select 'Record Type 1', from: 'Record Type'
            within '.recordscolumn form' do
              click_on 'Show'
            end
          end

          it 'should have all' do
            expect(page).to have_content 'Record 1'
            expect(page).to have_no_content 'Record 2'
            expect(page).to have_content 'Record 3'
            expect(page).to have_no_content 'Record 4'
          end
        end
      end

      context 'record type 2' do
        context 'not signed in' do
          before do
            visit '/records'
            select 'Record Type 2', from: 'Record Type'
            within '.recordscolumn form' do
              click_on 'Show'
            end
          end

          it 'should have no button' do
            expect(page).to have_no_content 'Record 1'
            expect(page).to have_content 'Record 2'
            expect(page).to have_no_content 'Record 3'
            expect(page).to have_no_content 'Record 4'
          end
        end

        context 'signed in' do
          before do
            visit connection_types_path
            sign_in('user2@gmail.com', 'rediculouslycomplexpassword54321')
            visit '/records'
            select 'Record Type 2', from: 'Record Type'
            within '.recordscolumn form' do
              click_on 'Show'
            end
          end

          it 'should have all' do
            expect(page).to have_no_content 'Record 1'
            expect(page).to have_content 'Record 2'
            expect(page).to have_no_content 'Record 3'
            expect(page).to have_content 'Record 4'
          end
        end
      end
    end
  end
end
