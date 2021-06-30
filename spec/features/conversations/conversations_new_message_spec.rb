require 'rails_helper'

RSpec.feature "Conversations show", type: :feature do
  context 'not signed in' do
    # skipping because new_user_session_path is tested
  end

  context 'signed in' do
    describe 'permissions who is allowed to see what message' do
      let!(:me) do
        create :user, :confirmed, :free, username: 'something',
          email: 'me@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:collaborator1) do
        create :user, :confirmed, :free, username: 'collaborator1',
          email: 'collaborator1@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:collaborator2) do
        create :user, :confirmed, :free, username: 'collaborator2',
          email: 'collaborator2@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:stranger) do
        create :user, :confirmed, :free, username: 'stranger',
          email: 'stranger@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:conversation1) { create :conversation }
      let!(:conversation2) { create :conversation }
      let!(:conversation3) { create :conversation }
      let!(:conversation4) { create :conversation }

      let!(:participation1_1) { create :participation, conversation: conversation1, user: me }
      let!(:participation1_2) { create :participation, conversation: conversation1, user: collaborator1 }

      let!(:participation2_1) { create :participation, conversation: conversation2, user: me }
      let!(:participation2_2) { create :participation, conversation: conversation2, user: collaborator2 }

      let!(:participation3_1) { create :participation, conversation: conversation3, user: collaborator1 }
      let!(:participation3_2) { create :participation, conversation: conversation3, user: collaborator2 }

      let!(:participation4_1) { create :participation, conversation: conversation4, user: collaborator2 }
      let!(:participation4_2) { create :participation, conversation: conversation4, user: stranger }

      describe 'sending a message to the conversation' do
        before do
          visit root_path
          sign_in('me@gmail.com', 'rediculouslycomplexpassword54321')
          visit conversation_messages_path(conversation1)
          fill_in 'message_body', with: 'New Message Blah Blah good'
          click_on 'Send'
        end

        context 'sender' do
          it 'should redirect me to the same conversation' do
            expect(current_path).to eq conversation_messages_path(conversation1)
          end

          it 'should show me my message I just sent' do
            expect(page).to have_content 'Blah Blah good'
          end

          it 'should persist the message after page reload' do
            visit root_path
            visit conversation_path(conversation1)

            expect(page).to have_content 'Blah Blah good'
          end

          it 'should mark it as read to the sender' do
            expect(page).to have_css '.card-body'
            expect(page).to have_no_css '.card-body.bg-light'
          end
        end

        context 'the reader' do
          before do
            click_on 'Logout'
            visit root_path
            sign_in('collaborator1@gmail.com', 'rediculouslycomplexpassword54321')
            visit conversation_path(conversation1)
          end

          it 'should be received by the other participant(s)' do
            expect(page).to have_content 'Blah Blah good'
          end

          it 'should mark it as unread to the reader' do
            expect(page).to have_css '.card-body.bg-light'
          end
        end
      end
    end
  end
end

