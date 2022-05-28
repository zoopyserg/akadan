require 'rails_helper'

RSpec.feature "Signins", type: :feature do
  before { visit new_user_session_path }

  describe 'password recovery' do
    it 'should have a "forgot password" form' do
      within '.card-authentication1' do
        click_on 'Reset Password'
        expect(current_path).to eq new_user_password_path
      end
    end
  end

  describe 'sign up from sign in form' do
    it 'should have a button to sign up' do
      within '.card-authentication1' do
        click_on 'Sign Up here'
        expect(current_path).to eq new_user_registration_path
      end
    end
  end

  describe 'sign in' do
    context 'failed' do
      context 'user does not exist' do
        it 'should show warning' do
          expect(page).to have_no_content 'Invalid Email or password.'
          sign_in('nonexistent@gmail.com', 'anythingblahblah')

          expect(page).to have_content 'Invalid Email or password.'
        end

        it 'should still be on a sign in page' do
          sign_in('nonexistent@gmail.com', 'anythingblahblah')

          expect(current_path).to eq new_user_session_path
        end
      end

      context 'blank fields' do
        it 'should show warning for blank email' do
          expect(page).to have_no_content 'Invalid Email or password.'
          sign_in('', 'password1')

          expect(page).to have_content 'Invalid Email or password.'
        end

        it 'should show warning for blank password' do
          expect(page).to have_no_content 'Invalid Email or password.'
          sign_in('something@gmail.com', '')

          expect(page).to have_content 'Invalid Email or password.'
        end
      end
    end

    context 'success', :records_index do
      let!(:user) { create :user, :confirmed, :free, username: 'something',
                                                     email: 'jack.daniels@gmail.com',
                                                     password: 'rediculouslycomplexpassword54321',
                                                     password_confirmation: 'rediculouslycomplexpassword54321' }
      let!(:record) { create :record, :with_dot, name: 'my problem', user: user }

      it 'should say I signed in' do
        expect(page).to have_no_content 'Welcome. You are signed in'

        sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')

        expect(current_path).to eq records_path

        expect(page).to have_content 'Welcome. You are signed in'
      end
    end
  end
end
