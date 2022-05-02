require 'rails_helper'

RSpec.feature "Connection Types Index Directional", type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_connection_type) { create :connection_type, directional: true, user: user1, is_public: true }
  let!(:private_connection) { create :connection_type, directional: false, user: user2, is_public: false }

  context 'not signed in' do
    before { visit connection_types_path }

    it 'should say directional' do
      expect(page).to have_content 'Directional'
    end

    it 'should not say non-directional' do
      expect(page).to have_no_content 'Non-Directional'
    end
  end

  context 'signed in' do
    before do
      login_as user2
      visit connection_types_path
    end

    it 'should say directional' do
      expect(page).to have_content 'Directional', count: 2
    end

    it 'should say non-directional' do
      expect(page).to have_content 'Non-Directional'
    end
  end
end
