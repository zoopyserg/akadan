require 'rails_helper'

RSpec.feature "ConnectionsIndex Record Names", type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:record_a) { create :record, name: 'Some Really Good Record', user: user1, is_public: true }
  let!(:record_b) { create :record, name: 'Some Even Better Record', user: user1, is_public: true }
  let!(:public_connection) { create :connection, user: user1, record_a: record_a, record_b: record_b, is_public: true }

  before { visit connections_path }

  it 'should show the name of the first record' do
    expect(page).to have_content 'Some Really Good Record'
  end

  it 'should show the name of the first record' do
    expect(page).to have_content 'Some Even Better Record'
  end
end
