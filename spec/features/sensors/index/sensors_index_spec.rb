require 'rails_helper'

RSpec.feature "Sensors Indices Permissions", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_sensor) { create :sensor, name: 'Public Connection', user: user, is_public: true }
  let!(:private_sensor) { create :sensor, name: 'Private Connection', user: user, is_public: false }

  context 'not signed in' do
    before { visit sensors_path }

    it 'should stay on this page (no redirect)' do
      expect(current_path).to eq sensors_path
    end

    it 'should show public sensor types' do
      expect(page).to have_content 'Public Connection'
    end

    it 'should show my own sensor types' do
      expect(page).to have_no_content 'Private Connection'
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit sensors_path
    end

    it 'should stay on this page (no redirect)' do
      expect(current_path).to eq sensors_path
    end

    it 'should show public sensor types' do
      expect(page).to have_content 'Public Connection'
    end

    it 'should show my own sensor types' do
      expect(page).to have_content 'Private Connection'
    end
  end
end
