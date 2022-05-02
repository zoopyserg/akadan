require 'rails_helper'

RSpec.feature "Connection Types Index Destructive", type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_connection_type) { create :connection_type, destructive: true, user: user1, is_public: true }
  let!(:private_connection) { create :connection_type, destructive: false, user: user2, is_public: false }

  before { ConnectionType.where.not(id: [public_connection_type.id, private_connection.id]).destroy_all }

  context 'not signed in' do
    before { visit connection_types_path }

    it 'should say destructive' do
      expect(page).to have_content 'Destructive'
    end

    it 'should not say non-destructive' do
      expect(page).to have_no_content 'Non-Destructive'
    end
  end

  context 'signed in' do
    before do
      login_as user2
      visit connection_types_path
    end

    it 'should say destructive' do
      expect(page).to have_content 'Destructive', count: 2
    end

    it 'should say non-destructive' do
      expect(page).to have_content 'Non-Destructive'
    end
  end
end
