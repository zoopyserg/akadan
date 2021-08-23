require 'rails_helper'

RSpec.feature "Decising which records to show", :records_index, :focus, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, username: 'something1', email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, username: 'something2', email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  let!(:connection_type) { create :connection_type, name: 'Subsystem', is_public: true }
  let!(:record_type) { create :record_type, name: 'Subsystem', is_public: true }

  context 'showing all records' do
    let!(:record1) { create :record, name: 'Record 1', user: user2, is_public: true }
    let!(:record2) { create :record, name: 'Record 2', user: user2, is_public: false }
    let!(:record3) { create :record, name: 'Record 3', user: user1, is_public: false }

    context 'not signed in' do
      describe 'a button' do
        before { visit '/records' }

        it 'should have no button' do
          expect(page).to have_content 'Record 1'
          expect(page).to have_no_content 'Record 2'
          expect(page).to have_no_content 'Record 3'
        end
      end
    end

    context 'signed in' do
      before do
        visit root_path
        sign_in('user2@gmail.com', 'rediculouslycomplexpassword54321')
        visit '/records'
      end

      it 'should have all' do
        expect(page).to have_content 'Record 1'
        expect(page).to have_content 'Record 2'
        expect(page).to have_no_content 'Record 3'
      end
    end
  end
end
