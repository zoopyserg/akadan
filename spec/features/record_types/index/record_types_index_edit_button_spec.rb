require 'rails_helper'

RSpec.feature "RecordTypesIndex Edit", type: :feature do
  let!(:user) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_record_type) { create :record_type, name: 'Public Record Type', user: user, is_public: true }
  let!(:private_record_type) { create :record_type, name: 'Private Record Type', user: user, is_public: false }

  context 'not signed in' do
    before { visit record_types_path }

    it 'should not have edit button' do
      expect(page).to have_no_link 'Edit'
    end
  end

  context 'signed in' do
    before do
      login_as user2
      visit record_types_path
    end

    xit 'should it have edit button?' do

    end
  end
end
