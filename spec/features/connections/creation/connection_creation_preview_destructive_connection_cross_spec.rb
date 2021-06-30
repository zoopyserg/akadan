require 'rails_helper'

RSpec.feature "ConnectionCreation Destructive Cross", type: :feature do
  context 'not signed in' do
    # skipping because it is tested in Success
  end

  context 'signed in' do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:connection_type) { create :connection_type, name: 'Regular Type', destructive: destructive, user: user }
    let!(:record_a) { create :record, name: 'Record A', user: user }
    let!(:record_b) { create :record, name: 'Record B', user: user }

    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit new_record_connection_type_connection_path(record_a, connection_type)
    end

    context 'Destructive' do
      let(:destructive) { true }

      it { expect(page).to have_css '#destructive-preview .zmdi.zmdi-close' }
    end

    context 'Non Destructive' do
      let(:destructive) { false }

      it { expect(page).to have_no_css '#destructive-preview .zmdi.zmdi-close' }
    end
  end
end
