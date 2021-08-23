require 'rails_helper'

RSpec.feature "Record Remove From Favourites", :records_index, type: :feature do
  let!(:user1) { create :user, :confirmed, :free, username: 'user1', email: 'user1@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, username: 'user2', email: 'user2@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

  let!(:public_record) { create :record, user: user1, is_public: true }
  let!(:private_record) { create :record, user: user2, is_public: false }

  let!(:bookmark1) { create :bookmark, user: user1, record: public_record }
  let!(:bookmark2) { create :bookmark, user: user1, record: private_record }
  let!(:bookmark3) { create :bookmark, user: user2, record: public_record }
  let!(:bookmark4) { create :bookmark, user: user2, record: private_record }

  context 'not signed in' do
    before { visit record_path(public_record) }

    it 'should say who created one record' do
      expect(page).to have_no_content 'Remove from Favourites'
    end
  end

  context 'signed in' do
    context 'user1 sign in' do
      before do
        visit root_path
        sign_in('user1@gmail.com', 'rediculouslycomplexpassword54321')
        visit record_path(public_record)
      end

      it 'should have a button' do
        expect(page).to have_content 'Remove from Favourites', count: 1
      end

      it 'should have no button' do
        expect(page).to have_no_content 'Add to Favourites'
      end

      it 'should add to favourites' do
        expect{
          click_on 'Remove from Favourites'
        }.to change{
          user1.favourite_records.count
        }.by(-1)
      end

      it 'should redirect to records path' do
        click_on 'Remove from Favourites'
        expect(current_path).to eq record_path(public_record)
      end
    end

    context 'user2 sign in' do
      before do
        visit root_path
        sign_in('user2@gmail.com', 'rediculouslycomplexpassword54321')
      end

      context 'public' do
        before { visit record_path(public_record) }
        it 'should say who created public record' do
          expect(page).to have_content 'Remove from Favourites'
        end

        it 'should have no button' do
          expect(page).to have_no_content 'Add to Favourites'
        end
      end

      context 'private' do
        before { visit record_path(private_record) }
        it 'should say who created private record' do
          expect(page).to have_content 'Remove from Favourites'
        end

        it 'should have no button' do
          expect(page).to have_no_content 'Add to Favourites'
        end
      end
    end
  end
end