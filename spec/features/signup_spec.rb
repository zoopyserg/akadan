require 'rails_helper'

RSpec.feature "Signups", type: :feature do
  before { visit new_user_registration_path }

  describe 'sign in from sign up form' do
    it 'should have a button to sign in' do
      within '.card-authentication1' do
        click_on 'Sign In here'
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'sign up' do
    context 'failed' do
      context 'confirmation emails' do
        let!(:user) { create :user, :confirmed, :free, username: "takenusername", email: 'something@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

        it "should send a confirmation email" do
          expect {
            sign_up('takenusername', 'John', 'Wick', 'something@gmail.com', 'password1', 'password1')
          }.to change { ActionMailer::Base.deliveries.size }.by(0)
        end
      end

      context 'different passwords' do
        it 'should show passwords warning' do
          expect(page).to have_no_content "doesn't match"
          sign_up('username', 'John', 'Wick', 'something@gmail.com', 'password1', 'PASSWORD2')

          expect(page).to have_content "doesn't match"
        end
      end

      context 'blank fields' do
        it 'should show warning for blank username' do
          expect(page).to have_no_content "can't be blank"
          sign_up('', 'John', 'Wick', 'something@gmail.com', 'password1', 'password1')

          expect(page).to have_content "can't be blank"
        end

        it 'should show warning for blank first name' do
          expect(page).to have_no_content "can't be blank"
          sign_up('username', '', 'Wick', 'something@gmail.com', 'password1', 'password1')

          expect(page).to have_content "can't be blank"
        end

        it 'should show warning for blank last name' do
          expect(page).to have_no_content "can't be blank"
          sign_up('username', 'John', '', 'something@gmail.com', 'password1', 'password1')

          expect(page).to have_content "can't be blank"
        end

        it 'should show warning for blank email' do
          expect(page).to have_no_content "can't be blank"
          sign_up('username', 'John', 'Wick', '', 'password1', 'password1')

          expect(page).to have_content "can't be blank"
        end

        it 'should show warning for blank password' do
          expect(page).to have_no_content "can't be blank"
          sign_up('username', 'John', 'Wick', 'something@gmail.com', '', 'password1')

          expect(page).to have_content "can't be blank"
        end

        it 'should show warning for blank password_confirmation' do
          expect(page).to have_no_content "doesn't match"
          sign_up('username', 'John', 'Wick', 'something@gmail.com', 'password1', '')

          expect(page).to have_content "doesn't match"
        end

        it 'should show warning for not accepted terms' do
          expect(page).to have_no_content "Please accept the Terms"
          sign_up_no_confirm('username', 'John', 'Wick', 'something@gmail.com', 'password1', 'password1')

          expect(page).to have_content "Please accept the Terms"
        end
      end

      context 'already taken' do
        let!(:user) { create :user, :confirmed, :free, username: "takenusername", email: 'something@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

        it 'should show warning for taken username' do
          expect(page).to have_no_content "already been taken"
          sign_up('takenusername', 'John', 'Wick', 'newemail@gmail.com', 'password1', 'password1')

          expect(page).to have_content "already been taken"
        end

        it 'should show warning for taken username CaseInsensitive' do
          expect(page).to have_no_content "already been taken"
          sign_up('taKeNuSerNaMe', 'John', 'Wick', 'newemail@gmail.com', 'password1', 'password1')

          expect(page).to have_content "already been taken"
        end

        it 'should show warning for taken email' do
          expect(page).to have_no_content "already been taken"
          sign_up('newusername', 'John', 'Wick', 'something@gmail.com', 'password1', 'password1')

          expect(page).to have_content "already been taken"
        end
      end

      context 'invalid fields' do
        it 'should show warning for invalid username' do
          expect(page).to have_no_content "invalid"
          sign_up('s9fv sdf(#*@(#', 'John', 'Wick', 'something@gmail.com', 'password1', 'password1')

          expect(page).to have_content "Only latin letters and numbers allowed"
        end

        it 'should show warning for invalid first name' do
          expect(page).to have_no_content "Only letters allowed"
          sign_up('username', 'kjnsdk fv9s dfvsskjnr343 0', 'Wick', 'something@gmail.com', 'password1', 'password1')

          expect(page).to have_content "Only letters allowed"
        end

        it 'should show warning for invalid last name' do
          expect(page).to have_no_content "Only letters allowed"
          sign_up('username', 'John', '9sdf8 s9fv8s df9v sdfvs98vf 9s343', 'something@gmail.com', 'password1', 'password1')

          expect(page).to have_content "Only letters allowed"
        end
      end

    end

    context 'success' do
      let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
      let!(:record) { create :record, name: 'my problem', user: user }

      it 'should say I signed in' do
        expect(page).to have_no_content 'signed up successfully'

        sign_up('username', 'John', 'Wick', 'something@gmail.com', 'password1', 'password1')

        expect(page).to have_content 'signed up successfully'

        expect(current_path).to eq root_path
      end

      it "should send a confirmation email" do
        expect {
          sign_up('username', 'John', 'Wick', 'something@gmail.com', 'password1', 'password1')
        }.to change { ActionMailer::Base.deliveries.size }.by(1)
      end
    end
  end
end
