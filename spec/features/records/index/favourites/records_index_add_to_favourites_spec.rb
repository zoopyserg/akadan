require 'rails_helper'

RSpec.feature "Record Add To Favourites", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, username: 'user1', email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, username: 'user2', email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  let!(:public_record) { create :record, user: user1, is_public: true }
  let!(:private_record) { create :record, user: user2, is_public: false }

  context 'not signed in' do
    before { visit records_path }

    it 'should say who created one record' do
      expect(page).to have_no_content 'Add to Favourites'
    end
  end

  context 'signed in' do
    context 'user1 sign in' do
      before do
        visit root_path
        sign_in('user1@gmail.com', 'rediculouslycomplexpassword54321')
        visit records_path
      end

      it 'should have a button' do
        expect(page).to have_content 'Add to Favourites', count: 1
      end

      it 'should have no button' do
        expect(page).to have_no_content 'Remove from Favourites'
      end

      it 'should add to favourites' do
        expect{
          click_on 'Add to Favourites'
        }.to change{
          user1.favourite_records.count
        }.by(1)
      end

      it 'should redirect to records path' do
        click_on 'Add to Favourites'
        expect(current_path).to eq records_path
      end
    end

    context 'user2 sign in' do
      before do
        visit root_path
        sign_in('user2@gmail.com', 'rediculouslycomplexpassword54321')
        visit records_path
      end

      it 'should say who created public record' do
        expect(page).to have_content 'Add to Favourites', count: 2
      end

      it 'should have no button' do
        expect(page).to have_no_content 'Remove from Favourites'
      end
    end
  end
end
