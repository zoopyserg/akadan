require 'rails_helper'

RSpec.feature "ConnectionCreation One To Many Arrow", type: :feature do
  context 'not signed in' do
    # skipping because it is tested in Success
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:connection_type) { create :connection_type, name: 'Regular Type', one_to_many: one_to_many, user: user }
    let!(:record_a) { create :record, name: 'Record A', user: user }
    let!(:record_b) { create :record, name: 'Record B', user: user }

    before do
      login_as user
      visit new_record_connection_type_connection_path(record_a, connection_type)
    end

    context 'one to many' do
      let(:one_to_many) { true }

      it { expect(page).to have_css '.zmdi.zmdi-arrow-split.rotated' }
    end

    context 'one to one' do
      let(:one_to_many) { false }

      it { expect(page).to have_no_css '.zmdi.zmdi-arrow-down.rotated' }
    end
  end
end
