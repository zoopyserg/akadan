require 'rails_helper'

RSpec.feature "Record Created By", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:private_record) { create :record, user: user2, is_public: false }

  let!(:main_record1) { create :record, user: user1, is_public: true }
  let!(:connection1) { create :connection, record_a: main_record1, record_b: private_record, user: user1 }

  context 'not signed in' do
    before { visit record_path(main_record1) }

    it 'should say who created one record' do
      within '.recordscolumn' do
        expect(page).to have_no_link 'Show'
      end
    end
  end

  context 'signed in', :js do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit record_path(main_record1)

      within '.recordscolumn' do
        click_on 'Show'
      end
    end

    it 'should say who created public record' do
      expect(current_path).to eq record_path(private_record)
    end
  end
end
