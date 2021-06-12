require 'rails_helper'

RSpec.feature "ConnectionCreations B to A", type: :feature do
  context 'not signed in' do
    # skipping because it is tested in Success
  end

  # Now I have a problem with this, not all connections can be reversible because the constraints mostly affect the target
  # In other words, if I select B to be A, then the record that was A may be inaccessible as B.
  # So... Yeah. I can have a button that would choose B as A, but then for B the list will be different (and may not include A).
  xcontext 'signed in' do
    let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:connection_type) { create :connection_type, name: 'Regular Type', user: user }
    let!(:record_a) { create :record, name: 'Record A', user: user }
    let!(:record_b) { create :record, name: 'Record B', user: user }

    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit new_connection_path
    end

    it 'should let me create' do
      expect(page).to have_no_content 'successfully created'
      create_connection('some connection', 'description', 'Regular Type', 'Record A', 'Record B')

      expect(page).to have_content 'successfully created'
    end

    it 'should open index page' do
      create_connection('some connection', 'description', 'Regular Type', 'Record A', 'Record B')
      expect(current_path).to eq connections_path
    end
  end
end
