require 'rails_helper'

RSpec.feature "Profile Show About", type: :feature do
  let!(:user1) do
    create :user, :confirmed, :free, about: 'I am an awesome user about', is_public: true
  end

  let!(:stranger) do
    create :user, :confirmed, :free, about: 'I am an awesome stranger about', is_public: false
  end

  context 'not signed in' do
    context 'me' do
      before { visit user_path(user1) }

      it { expect(page).to have_content 'I am an awesome user about' }
      it { expect(page).to have_no_content 'I am an awesome stranger about' }
    end

    context 'stranger' do
      before { visit user_path(stranger) }

      it { expect(page).to have_no_content 'I am an awesome user about' }
      it { expect(page).to have_content 'I am an awesome stranger about' }
    end
  end

  context 'signed in' do
    before do
      login_as user1
    end

    context 'me' do
      before { visit user_path(user1) }

      it { expect(page).to have_content 'I am an awesome user about' }
      it { expect(page).to have_no_content 'I am an awesome stranger about' }
    end

    context 'stranger' do
      before { visit user_path(stranger) }

      it { expect(page).to have_no_content 'I am an awesome user about' }
      it { expect(page).to have_content 'I am an awesome stranger about' }
    end
  end
end
