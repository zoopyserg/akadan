require 'rails_helper'

RSpec.feature "RecordsIndices", :records_index, type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_record) { create :record, name: 'Public Record', user: user, is_public: true }
  let!(:private_record) { create :record, name: 'Private Record', user: user, is_public: false }

  context 'not signed in' do
    context 'public' do
      before { visit record_path(public_record) }
      it 'should show public connection types' do
        expect(page).to have_content 'Public Record'
      end
    end

    context 'private' do
      before { visit record_path(private_record) }
      it 'should show my own connection types' do
        expect(page).to have_no_content 'Private Record'
      end
    end
  end

  context 'signed in' do
    before do
      login_as user
      visit record_path(public_record)
    end

    it 'should stay on this page (no redirect)' do
      expect(current_path).to eq record_path(public_record)
    end

    context 'public' do
      before { visit record_path(public_record) }
      it 'should show public connection types' do
        expect(page).to have_content 'Public Record'
      end
    end

    context 'private' do
      before { visit record_path(private_record) }
      it 'should show my own connection types' do
        expect(page).to have_content 'Private Record'
      end
    end
  end
end
