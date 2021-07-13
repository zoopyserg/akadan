require 'rails_helper'

RSpec.feature "Records Index Irrelevant Button", type: :feature do
  let!(:user1) { create :user, :confirmed, :free, username: 'something1', email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, username: 'something2', email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  let!(:connection_type) { create :connection_type, name: 'Extracted To...', is_public: true }

  # see Down Error for my thoughts on likes and dislikes.
  xcontext 'public someone elses record' do
    let!(:record) { create :record, name: 'Record B', user: user2, is_public: true }

    context 'not signed in' do
      describe 'a button' do
        before { visit records_path }

        it 'should have no button' do
          expect(page).to have_no_link 'Extract Into Separate Project'
        end
      end
    end

    context 'signed in' do
      before do
        visit root_path
        sign_in('user1@gmail.com', 'rediculouslycomplexpassword54321')
        visit records_path
      end

      it 'should allow to edit' do
        expect(page).to have_link 'Extract Into Separate Project'
      end

      it 'should let me create subrecords' do
        expect{
          click_on 'Extract Into Separate Project'
        }.to change{
          record.children.where(separate_project: true, name: 'Record B').count
        }.by(1)
      end
    end
  end

  xcontext 'private my record' do
    let!(:record) { create :record, name: 'Record B', user: user1, is_public: true }

    context 'not signed in' do
      describe 'a button' do
        before { visit records_path }

        it 'should have no button' do
          expect(page).to have_no_link 'Extract Into Separate Project'
        end
      end
    end

    context 'signed in' do
      before do
        visit root_path
        sign_in('user1@gmail.com', 'rediculouslycomplexpassword54321')
        visit records_path
      end

      describe 'a button' do
        it 'should allow to edit' do
          expect(page).to have_link 'Extract Into Separate Project'
        end

        it 'should let me create subrecords' do
          expect{
            click_on 'Extract Into Separate Project'
          }.to change{
            record.children.where(separate_project: true, name: 'Record B').count
          }.by(1)
        end
      end
    end
  end

  xcontext 'private someone elses record' do
    let!(:record) { create :record, name: 'Record B', user: user2, is_public: false }

    context 'not signed in' do
      describe 'a button' do
        before { visit records_path }

        it 'should have no button' do
          expect(page).to have_no_link 'Extract Into Separate Project'
        end
      end
    end

    context 'signed in' do
      before do
        visit root_path
        sign_in('user1@gmail.com', 'rediculouslycomplexpassword54321')
        visit records_path
      end

      describe 'a button' do
        before { visit records_path }

        it 'should have no button' do
          expect(page).to have_no_link 'Extract Into Separate Project'
        end
      end
    end
  end
end
