require 'rails_helper'

RSpec.feature "Passwordresets", type: :feature do
  before { visit new_user_password_path }

  describe 'sign in from password reset page' do
    it 'should have a button to sign in' do
      within '.card-authentication1' do
        click_on 'Sign In'
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'reset' do
    context 'failed' do
      context 'user does not exist' do
        it 'should show warning' do
          expect(page).to have_no_content 'Email not found'
          reset_password('nonexistent@gmail.com')

          expect(page).to have_content 'Email not found'
        end
      end

      context 'blank fields' do
        it 'should show warning' do
          expect(page).to have_no_content "can't be blank"
          reset_password('')

          expect(page).to have_content "can't be blank"
        end
      end
    end

    context 'success' do
      let!(:user) { create :user, :confirmed, :free, username: 'something',
                                                     email: 'jack.daniels@gmail.com',
                                                     password: 'rediculouslycomplexpassword54321',
                                                     password_confirmation: 'rediculouslycomplexpassword54321' }
      let!(:record) { create :record, name: 'my problem', user: user }

      it 'should say I signed in' do
        expect(page).to have_no_content 'You will receive an email'

        reset_password('jack.daniels@gmail.com')

        expect(current_path).to eq new_user_session_path

        expect(page).to have_content 'You will receive an email'
      end

      it 'should send an email' do
        expect {
          reset_password('jack.daniels@gmail.com')
        }.to change { ActionMailer::Base.deliveries.size }.by(1)
      end

    end
  end
end
