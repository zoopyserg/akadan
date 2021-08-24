require 'rails_helper'

RSpec.feature "RecordsIndices", :records_index, type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_record) { create :record, name: 'Public Record', user: user, is_public: true }
  let!(:private_record) { create :record, name: 'Private Record', user: user, is_public: false }

  let!(:main_record1) { create :record, user: user, is_public: true }
  let!(:connection1) { create :connection, record_a: main_record1, record_b: public_record, user: user }
  let!(:connection2) { create :connection, record_a: main_record1, record_b: private_record, user: user }

  context 'not signed in' do
    before { visit record_path(main_record1) }

    it 'should stay on this page (no redirect)' do
      expect(current_path).to eq record_path(main_record1)
    end

    it 'should show public connection types' do
      expect(page).to have_content 'Public Record'
    end

    it 'should show my own connection types' do
      expect(page).to have_no_content 'Private Record'
    end
  end

  context 'signed in' do
    before do
      visit root_path
      click_on 'Login'
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit record_path(main_record1)
    end

    it 'should stay on this page (no redirect)' do
      expect(current_path).to eq record_path(main_record1)
    end

    it 'should show public connection types' do
      expect(page).to have_content 'Public Record'
    end

    it 'should show my own connection types' do
      expect(page).to have_content 'Private Record'
    end
  end
end
