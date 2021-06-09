require 'rails_helper'

RSpec.feature "ConnectionsIndex Destructive Cross", type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:record_a) { create :record, name: 'Some Really Good Record', user: user1, is_public: true }
  let!(:record_b) { create :record, name: 'Some Even Better Record', user: user1, is_public: true }
  let!(:connection_type) { create :connection_type, user: user1, destructive: destructive, is_public: true }
  let!(:public_connection) { create :connection, user: user1, record_a: record_a, record_b: record_b, connection_type: connection_type, is_public: true }

  before { visit connections_path }

  context 'is destructive' do
    let(:destructive) { true }

    it 'should show the name of the first record' do
      within '.connection-qualities' do
        expect(page).to have_css '.zmdi-close'
      end
    end
  end

  context 'is not destructive' do
    let(:destructive) { false }

    it 'should show the name of the first record' do
      within '.connection-qualities' do
        expect(page).to have_no_css '.zmdi-close'
      end
    end
  end
end
