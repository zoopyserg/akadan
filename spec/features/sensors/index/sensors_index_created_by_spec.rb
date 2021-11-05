require 'rails_helper'

RSpec.feature "Sensors Index Created By", type: :feature do
  let!(:user1) { create :user, :confirmed, :free, first_name: 'John', last_name: 'Smith', username: 'something1', email: 'jacky.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:user2) { create :user, :confirmed, :free, first_name: 'Bob', last_name: 'Smith', username: 'something2', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
  let!(:public_sensor) { create :sensor, user: user1, is_public: true }
  let!(:private_sensor) { create :sensor, user: user2, is_public: false }

  context 'not signed in' do
    before { visit sensors_path }

    it 'should say who created one record' do
      expect(page).to have_content 'John Smith'
      click_on 'John Smith'
      expect(current_path).to eq user_path(user1)
    end

    it 'should not say names of people who do not have public sensors' do
      expect(page).to have_no_content 'Bob Smith'
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
      visit sensors_path
    end

    it 'should say who created public record' do
      expect(page).to have_content 'John Smith'
      click_on 'John Smith'
      expect(current_path).to eq user_path(user1)
    end

    it 'should say I created a private record' do
      expect(page).to have_content 'Bob Smith'
      click_on 'Bob Smith'
      expect(current_path).to eq user_path(user2)
    end
  end
end
