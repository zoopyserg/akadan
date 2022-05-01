require 'rails_helper'

RSpec.feature "Record Created By", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_record) { create :record, user: user1, is_public: true, separate_project: true }
  let!(:private_record) { create :record, user: user2, is_public: false, separate_project: true }
  let!(:public_dot) { create :dot, user: user1, record: public_record, project: public_record, description: 'Public Description' }
  let!(:private_dot) { create :dot, user: user2, record: private_record, project: private_record, description: 'Private Description' }

  context 'not signed in' do
    context 'public record' do
      before { visit record_path(public_record) }

      it 'should say who created one record' do
        expect(page).to have_content 'Public Description'
      end
    end

    context 'private record' do
      before { visit record_path(private_record) }
      it 'should not say names of people who do not have public connections' do
        expect(page).to have_no_content 'Private Description'
      end
    end
  end

  context 'signed in' do
    before do
      login_as user2
    end

    context 'public record' do
      before { visit record_path(public_record) }

      it 'should say who created public record' do
        expect(page).to have_content 'Public Description'
      end
    end

    context 'private record' do
      before { visit record_path(private_record) }
      it 'should say I created a private record' do
        expect(page).to have_content 'Private Description'
      end
    end
  end
end
