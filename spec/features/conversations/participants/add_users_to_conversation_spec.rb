require 'rails_helper'

RSpec.feature "AddUsersToConversations", type: :feature do
  context 'not signed in' do
    let(:conversation) { create :conversation }
    it 'should redirect to sign in page' do
      visit new_conversation_participation_path(conversation)

      expect(current_path).to eq new_user_session_path
    end
  end

  context 'signed in' do
    describe 'permissions who is allowed to see what message' do
      let!(:me) do
        create :user, :confirmed, :free, username: 'something',
          first_name: 'Serge',
          email: 'me@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:collaborator1) do
        create :user, :confirmed, :free, username: 'collaborator1',
          first_name: 'Vasia',
          email: 'collaborator1@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:collaborator2) do
        create :user, :confirmed, :free, username: 'collaborator2',
          first_name: 'Petia',
          email: 'collaborator2@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:conversation1) { create :conversation }

      let!(:participation1_1) { create :participation, conversation: conversation1, user: me }
      let!(:participation1_2) { create :participation, conversation: conversation1, user: collaborator1 }

      let!(:message1) { create :message, conversation: conversation1, sender: me }

      let!(:reading1_1) { create :reading, message: message1, user: me }
      let!(:reading1_1) { create :reading, message: message1, user: collaborator1 }

      context 'I sign in' do
        before do
          login_as me
          visit conversation_messages_path(conversation1)
          click_on 'Participants'
          click_on 'Add a New Participant'
        end

        it 'should be accessible through a button' do
          expect(current_path).to eq new_conversation_participation_path(conversation1)
        end

        context 'new participant submitted' do
          before do
            fill_in 'participation_user_id', with: collaborator2.id
            click_on 'Add'
          end

          it 'should open the conversation for me' do
            expect(current_path).to eq conversation_participations_path(conversation1)
          end

          it 'should display names' do
            expect(page).to have_content 'Serge'
            expect(page).to have_content 'Vasia'
            expect(page).to have_content 'Petia'
          end
        end

      end
    end
  end
end
