require 'rails_helper'

RSpec.feature "Records Index Solve Button", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, username: 'something1', email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, username: 'something2', email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  context 'public someone elses record' do
    let!(:record) { create :record, :with_dot, user: user2, is_public: true, separate_project: false }
    let!(:project) { create :record, :with_dot, name: 'Some Project', user: user2, is_public: true, separate_project: true }

    context 'not signed in' do
      describe 'a button' do
        before { visit records_path }

        it 'should have no button' do
          expect(page).to have_link 'Repeated'
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
        login_as user1
        visit records_path
      end

      it 'should allow to edit' do
        expect(page).to have_link 'Repeated'
      end

      it 'should let me create subrecords' do
        click_on 'Repeated', match: :first
        expect(page).to have_content 'New Fact of Repetition'

        choose_project('Some Project')
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
    let!(:record) { create :record, :with_dot, user: user1, is_public: false }
    let!(:project) { create :record, :with_dot, name: 'Some Project', user: user2, is_public: true, separate_project: true }

    before { Record.where.not(id: [record.id, project.id]).destroy_all }

    context 'not signed in' do
      describe 'a button' do
        before { visit records_path }

        it 'should have no button' do
          expect(page).to have_link 'Repeated'
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
        login_as user1
        visit records_path
      end

      describe 'a button' do
        it 'should allow to edit' do
          expect(page).to have_link 'Repeated'
        end

        it 'should let me create subrecords' do
          click_on 'Repeated', match: :first
          expect(page).to have_content 'New Fact of Repetition'

          choose_project('Some Project')
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
          choose_project('Some Project')
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
    let!(:record) { create :record, :with_dot, user: user2, is_public: false }

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
        login_as user1
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
