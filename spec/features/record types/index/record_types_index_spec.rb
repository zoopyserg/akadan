require 'rails_helper'

RSpec.feature "RecordTypesIndices", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_record_type) { create :record_type, name: 'Public Record Type', user: user, is_public: true }
  let!(:private_record_type) { create :record_type, name: 'Private Record Type', user: user, is_public: false }

  context 'not signed in' do
    before { visit record_types_path }

    it 'should stay on this page (no redirect)' do
      expect(current_path).to eq record_types_path
    end

    it 'should show public connection types' do
      expect(page).to have_content 'Public Record Type'
    end

    it 'should show my own connection types' do
      expect(page).to have_no_content 'Private Record Type'
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit record_types_path
    end

    it 'should stay on this page (no redirect)' do
      expect(current_path).to eq record_types_path
    end

    it 'should show public connection types' do
      expect(page).to have_content 'Public Record Type'
    end

    it 'should show my own connection types' do
      expect(page).to have_content 'Private Record Type'
    end
  end
end
