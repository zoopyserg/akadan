require 'rails_helper'

RSpec.feature "Record Created By", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:private_record) { create :record, :with_dot, user: user2, is_public: false }

  context 'not signed in' do
    before { visit records_path }

    it 'should say who created one record' do
      expect(page).to have_no_link 'Show'
    end
  end

  context 'signed in' do
    before do
      login_as user2
      visit records_path
      within '.recordscolumn' do
        find(:css, 'a.btn-primary').click # selector for Show btn.
      end
    end

    it 'should say who created public record' do
      expect(current_path).to eq record_path(private_record)
    end
  end
end
