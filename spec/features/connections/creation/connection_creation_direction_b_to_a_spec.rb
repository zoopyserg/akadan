require 'rails_helper'

RSpec.feature "ConnectionCreations Direction B to A", type: :feature do
  context 'not signed in' do
    # skipping because it is tested in Success
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:connection_type) { create :connection_type, name: 'Regular Type', user: user }
    let!(:record_a) { create :record, name: 'Record A', user: user }
    let!(:record_b) { create :record, name: 'Record B', user: user }

    before do
      visit connections_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit new_record_connection_type_connection_path(record_b, connection_type)
      select 'Record A', from: :connection_record_b_id
      click_on 'Swap Direction'
    end

    it { expect(current_path).to eq new_record_connection_type_connection_path(record_a, connection_type) }
  end
end
