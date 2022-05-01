require 'rails_helper'

RSpec.feature "Record Created By", type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_record) { create :record, user: user1, is_public: true }
  let!(:private_record) { create :record, user: user2, is_public: false }
  let!(:public_dot) { create :dot, description: 'Public Description', record: public_record, user: user1, project: public_record }
  let!(:private_dot) {  create :dot, description: 'Private Description', record: private_record, user: user1, project: private_record }

  # Итак. У меня есть "паблик и прайват рекордс" (видят все или вижу только я)
  # Но здесь речь что тут чтоб ещё были группы юзеров. мол "видит только юзер Х". или "видит только группа юзеров Х в которой такие-то юзеры".
  xcontext 'not signed in' do
    before { visit records_path }

    it 'should say who created one record' do
      expect(page).to have_content 'Public Description'
    end

    it 'should not say names of people who do not have public connections' do
      expect(page).to have_no_content 'Private Description'
    end
  end

  xcontext 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit records_path
    end

    it 'should say who created public record' do
      expect(page).to have_content 'Public Description'
    end

    it 'should say I created a private record' do
      expect(page).to have_content 'Private Description'
    end
  end
end
