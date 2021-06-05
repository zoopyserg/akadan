# require 'rails_helper'
#
# RSpec.feature "Users", type: :feature, js: true do
#   before { visit root_path }
#
#   describe 'password recovery' do
#     it 'should have a "forgot password" form' do
#       within '.card-authentication1' do
#         click_on 'Reset Password'
#         expect(current_path).to eq new_user_password_path
#       end
#     end
#   end
#
#   describe 'sign up from sign in form' do
#     it 'should have a "forgot password" form' do
#       within '.card-authentication1' do
#         click_on 'Sign Up here'
#         expect(current_path).to eq new_user_registration_path
#       end
#     end
#   end
#
#   describe 'sign in' do
#     context 'failed' do
#       it 'should show warning' do
#         sign_in('nonexistent@gmail.com', 'anythingblahblah')
#
#         expect(page).to have_content 'Invalid Email or password.'
#       end
#     end
#
#     context 'success' do
#       let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
#       let!(:record) { create :record, name: 'my problem', user: user }
#
#       it 'should say I signed in' do
#         expect(page).not_to have_content 'signed in successfully'
#
#         sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#
#         expect(current_path).to eq root_path
#
#         expect(page).to have_content 'Signed in successfully'
#       end
#     end
#
#     context 'success' do
#       let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
#       let!(:record) { create :record, name: 'my problem', user: user }
#
#       it 'should sign in' do
#         expect(page).not_to have_content 'my problem'
#         expect(page).to have_css '.error'
#         expect(page).to have_css '#storageEnabled'
#
#         sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#
#         expect(current_path).to eq diary_path(locale: 'en')
#         expect(page).not_to have_css '.fa-sign-in-alt'
#         expect(page).to have_css '.fa-sign-out-alt'
#         expect(page).not_to have_css '.error'
#         expect(page).not_to have_css '#storageEnabled'
#
#         list_all
#         expect(page).to have_content 'my problem'
#       end
#
#       it 'should clear the records when user signs out' do
#         sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#         list_all
#         expect(page).to have_content 'my problem'
#         sign_out
#         expect(page).not_to have_content 'my problem'
#       end
#
#       it 'should show confirmations'
#       it 'should time out the session in 30 minutes of inactivity'
#     end
#   end
#
#   describe 'confirmations' do
#     # note: it might not be needed now when I have a sign in limit and no physical limits
#     it "should have the wording 'Please check your email for the confirmation link.' if I'm not confirmed"
#     it "should become active after clicking the link in email"
#   end
#
#   describe 'sign up' do
#     context 'failed' do
#       it 'should say passwords do not match' do
#         sign_up('nonexistent@gmail.com', 'password1', 'PASSWORD2')
#
#         expect(page).to have_content 'Passwords do not match'
#       end
#
#       it 'should say passwords do not match' do
#         sign_up('nonexistent@gmail.com', 'password1', 'PASSWORD2')
#
#         expect(page).to have_content 'Passwords do not match'
#       end
#     end
#
#     context 'success' do
#       let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
#       let!(:record) { create :record, name: 'my problem', user: user }
#
#       it 'should say I signed in' do
#         expect(page).not_to have_content 'signed in successfully'
#
#         sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#
#         expect(current_path).to eq root_path
#
#         expect(page).to have_content 'Signed in successfully'
#       end
#     end
#
#     it 'should sign up' do
#       expect(page).not_to have_content 'Registered successfully.'
#
#       # find('.fa-sign-in-alt').click
#       click_on 'Register'
#
#       within '.card-authentication1' do
#         fill_in 'exampleInputEmailId', with: email
#         fill_in 'exampleInputPassword', with: password
#         click_on 'Sign In'
#       end
#
#       fill_in 'E-mail:', with: 'jack.daniels@gmail.com'
#       fill_in 'Password:', with: 'rediculouslycomplexpassword54321'
#       fill_in 'Password again:', with: 'rediculouslycomplexpassword54321'
#       check 'I agree to Terms of Service'
#
#       scroll_down
#
#       click_button 'Register'
#
#       expect(page).to have_content 'Registered successfully.'
#
#       expect(page).not_to have_css 'nav .fa-sign-in-alt'
#       expect(page).not_to have_button 'Register'
#     end
#
#     it 'should have a journey once I sign up'
#     it "should block the account if it's not confirmed in 3 days"
#     it 'should be able to create records after sign up'
#     it 'should move the local records to the account'
#     it 'should disable local storage'
#     it 'should check if the password is not pwned'
#   end
#
#   describe 'record management for the registered user' do
#     let!(:user) { create :user, :confirmed, :free, email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
#
#     describe 'listing' do
#       let!(:user2) { create :user, :confirmed, :free, email: 'second.jackdaniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
#       let!(:record) { create :record, name: 'my record', user: user }
#       let!(:record2) { create :record, name: 'somebody elses record', user: user2 }
#
#       it 'should not contain somebody elses record' do
#         sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#         list_all
#         expect(page).to have_content 'my record'
#         expect(page).not_to have_content 'somebody elses record'
#       end
#     end
#
#     describe 'creating' do
#       let(:record_text) { 'hello my little problem' }
#
#       it 'should persist the created record' do
#         sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#
#         expect(page).not_to have_content 'TRIAL'
#
#         create_record record_text
#         list_all
#
#         expect(page).to have_content record_text
#
#         visit root_path(locale: 'en')
#         sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#         list_all
#
#         expect(page).to have_content record_text
#       end
#
#       it 'should hide the records if the session expired'
#     end
#
#     describe 'the solving of the record' do
#       context 'simple one record solving' do
#         let!(:record) { create :record, name: 'my record', user: user }
#
#         it 'should persist' do
#           sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#           list_all
#
#           expect(page).to have_content 'my record'
#           expect(page).not_to have_css checkmark(1)
#
#           list_all
#
#           solve(1, 1)
#
#           expect(page).to have_css checkmark(1)
#
#           visit root_path(locale: 'en')
#           sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#
#           list_all
#
#           expect(page).to have_css checkmark(1)
#         end
#       end
#
#       context 'complex multi-record solving' do
#         let!(:parent) { create :record, name: 'my parent record', user: user }
#         let!(:parent_child) { create :record, name: 'the record that will close everything', user: user }
#         let!(:parent_child_child) { create :record, name: 'the destroyed child', user: user }
#
#         before do
#           parent.children = [parent_child]
#           parent_child.children = [parent_child_child]
#         end
#
#         it 'should also check the rest of the records on back end the same way it solves on the front end' do
#           visit diary_path(locale: 'en')
#
#           expect(page).not_to have_content 'my parent record'
#           expect(page).not_to have_content 'the record that will close everything'
#           expect(page).not_to have_content 'the destroyed child'
#
#           sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#           list_all
#
#           expect(page).to have_content 'my parent record'
#           expect(page).to have_content 'the record that will close everything'
#           expect(page).to have_content 'the destroyed child'
#
#           solve(2, 2)
#           expect(page).to have_content 'Congratulations'
#           submit_modal
#
#           expect(page).to have_css checkmark(1), count: 2 # complex table is now the first
#           expect(page).to have_css crossed, count: 1
#
#           visit root_path(locale: 'en')
#           sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#           list_all
#
#           expect(page).to have_css checkmark(1), count: 2 # complex table is now the first
#           expect(page).to have_css crossed, count: 1
#         end
#       end
#     end
#
#     describe 'dots' do
#       let!(:record) { create :record, name: 'my record', user: user }
#
#       it 'should persist' do
#         sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#         list_all
#
#         expect(page).to have_content 'my record'
#         expect(page).not_to have_css dot
#
#         repeat 1
#
#         expect(page).to have_css dot
#
#         visit root_path(locale: 'en')
#         sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#         list_all
#
#         expect(page).to have_css dot
#       end
#     end
#
#     describe 'setting parent'  do
#       let!(:future_parent) { create :record, name: 'future parent', user: user }
#       let!(:future_child) { create :record, name: 'future child', user: user }
#
#       it 'should persist' do
#         sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#         list_all
#
#         expect(page).to have_content 'future parent'
#         expect(page).to have_content 'future child'
#
#         set_dependency(1, 'future child')
#
#         expect(page).to have_css circle
#
#         visit root_path(locale: 'en')
#         sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#
#         list_all
#         expect(page).to have_css circle
#       end
#     end
#
#
#     describe 'splitting' do
#       let!(:record) { create :record, name: 'my record', user: user }
#
#       context 'within limit' do
#         it 'should persist' do
#           sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#           list_all
#           expect(page).to have_content 'my record'
#
#           split 1, ['one child', 'second child']
#
#           expect(page).to have_content 'one child'
#           expect(page).to have_content 'second child'
#
#           expect(page).to have_css '.circle', count: 1
#
#           visit root_path(locale: 'en')
#           sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#           list_all
#
#           expect(page).to have_content 'my record'
#           expect(page).to have_content 'one child'
#           expect(page).to have_content 'second child'
#           expect(page).to have_css '.circle', count: 1
#         end
#       end
#
#       context 'out of limit' do
#         let(:children) {
#           [
#             'child 1', 'child 2', 'child 3', 'child 4', 'child 5', 'child 6', 'child 7', 'child 8',
#             'child 9', 'child 10', 'child 11', 'child 12', 'child 13', 'child 14', 'child 15', 'child 16',
#             'child 17', 'child 18', 'child 19', 'child 20', 'child 21', 'child 22', 'child 23', 'child 24',
#             'child 25', 'child 26', 'child 27', 'child 28', 'child 29', 'child 30', 'child 31', 'child 32',
#             'child 33', 'child 34', 'child 35'
#           ].join("\n")
#         }
#
#         let(:visible_children) { /child 1.*child 2.*child 3.*child 4.*child 5.*child 6.*child 7.*child 8.*child 9.*child 10.*child 11.*child 12.*child 13.*child 14.*child 15.*child 16.*child 17.*child 18.*child 19.*child 20.*child 21.*child 22.*child 23.*child 24.*child 25.*child 26.*child 27.*child 28.*child 29.*child 30.*child 31.*child 32.*child 33.*child 34.*child 35/m }
#
#         it 'should not have a limit for a registered user' do
#           sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#           list_all
#           expect(page).to have_content 'my record'
#
#           scroll_down
#           split 1, [children]
#
#           expect(page).to have_content visible_children
#
#           expect(page).to have_css '.circle', count: 1
#
#           visit root_path(locale: 'en')
#           sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321')
#           list_all
#
#           expect(page).to have_content visible_children
#           expect(page).to have_css '.circle', count: 1
#         end
#       end
#
#     end
#   end
# end
