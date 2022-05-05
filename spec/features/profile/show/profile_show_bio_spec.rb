require 'rails_helper'

RSpec.feature "Profile Show Bio", type: :feature do
  let!(:user1) do
    create :user, :confirmed, :free, bio: 'I am an awesome user bio', is_public: true
  end

  let!(:stranger) do
    create :user, :confirmed, :free, bio: 'I am an awesome stranger bio', is_public: false
  end

  context 'not signed in' do
    context 'me' do
      before { visit user_path(user1) }

      it { expect(page).to have_content 'I am an awesome user bio' }
      it { expect(page).to have_no_content 'I am an awesome stranger bio' }
    end

    context 'stranger' do
      before { visit user_path(stranger) }

      it { expect(page).to have_no_content 'I am an awesome user bio' }
      it { expect(page).to have_content 'I am an awesome stranger bio' }
    end
  end

  context 'signed in' do
    before do
      login_as user1
    end

    context 'me' do
      before { visit user_path(user1) }

      it { expect(page).to have_content 'I am an awesome user bio' }
      it { expect(page).to have_no_content 'I am an awesome stranger bio' }
    end

    context 'stranger' do
      before { visit user_path(stranger) }

      it { expect(page).to have_no_content 'I am an awesome user bio' }
      it { expect(page).to have_content 'I am an awesome stranger bio' }
    end
  end
end
