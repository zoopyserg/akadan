require 'rails_helper'

RSpec.feature "Records Index Solve Button", type: :feature do
  let!(:user1) { create :user, :confirmed, :free, username: 'something1', email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, username: 'something2', email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  context 'public someone elses record' do
    let!(:record) { create :record, user: user2, is_public: true, separate_project: false }
    let!(:project) { create :record, name: 'Some Project', user: user2, is_public: true, separate_project: true }

    context 'not signed in' do
      describe 'a button' do
        before { visit records_path }

        it 'should have no button' do
          expect(page).to have_no_link 'Repeated'
        end
      end

      describe 'a path authorization' do
        before { visit new_record_dot_path(record.id) }

        it 'should have no button' do
          expect(current_path).to eq new_user_session_path
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
        expect(page).to have_link 'Repeated'
      end

      it 'should let me create subrecords' do
        click_on 'Repeated', match: :first

        select 'Some Project', from: 'dot_project_id'
        fill_in 'Description', with: 'some description'
        fill_in 'Duration', with: '12345'

        expect{
          click_on 'Create'
        }.to change{
          record.dots.where(duration: 12345, description: 'some description').count
        }.by(1)
      end
    end
  end

  context 'private my record' do
    let!(:record) { create :record, user: user1, is_public: false }
    let!(:project) { create :record, name: 'Some Project', user: user2, is_public: true, separate_project: true }

    context 'not signed in' do
      describe 'a button' do
        before { visit records_path }

        it 'should have no button' do
          expect(page).to have_no_link 'Repeated'
        end
      end

      describe 'a path authorization' do
        before { visit new_record_dot_path(record) }

        it 'should have no button' do
          expect(current_path).to eq new_user_session_path
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
          expect(page).to have_link 'Repeated'
        end

        it 'should let me create subrecords' do
          click_on 'Repeated', match: :first

          select 'Some Project', from: 'dot_project_id'
          fill_in 'Description', with: 'some description'
          fill_in 'Duration', with: '12345'

          expect{
            click_on 'Create'
          }.to change{
            record.dots.where(duration: 12345, description: 'some description').count
          }.by(1)
        end
      end

      describe 'a path' do
        before { visit new_record_dot_path(record) }

        it 'should let me create subrecords' do
          select 'Some Project', from: 'dot_project_id'
          fill_in 'Description', with: 'some description'
          fill_in 'Duration', with: '12345'

          expect{
            click_on 'Create'
          }.to change{
            record.dots.where(duration: 12345, description: 'some description').count
          }.by(1)
        end
      end
    end
  end

  context 'private someone elses record' do
    let!(:record) { create :record, user: user2, is_public: false }

    context 'not signed in' do
      describe 'a button' do
        before { visit records_path }

        it 'should have no button' do
          expect(page).to have_no_link 'Repeated'
        end
      end

      describe 'a path authorization' do
        before { visit new_record_dot_path(record.id) }

        it 'should have no button' do
          expect(current_path).to eq new_user_session_path
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
          expect(page).to have_no_link 'Repeated'
        end
      end

      describe 'a path authorization' do
        before { visit new_record_dot_path(record) }

        it 'should have no button' do
          expect(current_path).to eq records_path
        end
      end
    end
  end
end
