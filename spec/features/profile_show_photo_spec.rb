require 'rails_helper'

RSpec.feature "Profile Show Name", type: :feature do
  let!(:user1) do
    create :user, :confirmed, :free, username: 'something',
      first_name: 'John',
      last_name: 'Wick',
      avatar: open_image('me.jpg'),
      email: 'me@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  let!(:stranger) do
    create :user, :confirmed, :free, username: 'stranger',
      first_name: 'Stranger',
      last_name: 'Public',
      avatar: open_image('stranger.jpg'),
      email: 'stranger@gmail.com',
      password: 'rediculouslycomplexpassword54321',
      password_confirmation: 'rediculouslycomplexpassword54321',
      is_public: true
  end

  context 'not signed in' do
    context 'me' do
      before { visit user_path(user1) }

      it { expect(page).to have_css "img[src*='me.jpg']" }
      it { expect(page).to have_no_css "img[src*='stranger.jpg']" }
    end

    context 'stranger' do
      before { visit user_path(stranger) }

      it { expect(page).to have_no_css "img[src*='me.jpg']" }
      it { expect(page).to have_css "img[src*='stranger.jpg']" }
    end
  end

  context 'signed in' do
    before do
      visit root_path
      sign_in('me@gmail.com', 'rediculouslycomplexpassword54321')
      visit people_path
    end

    context 'me' do
      before { visit user_path(user1) }

      it { expect(page).to have_css "img[src*='me.jpg']" }
      it { expect(page).to have_no_css "img[src*='stranger.jpg']" }
    end

    context 'stranger' do
      before { visit user_path(stranger) }

      it { expect(page).to have_no_css "img[src*='me.jpg']" }
      it { expect(page).to have_css "img[src*='stranger.jpg']" }
    end
  end
end
