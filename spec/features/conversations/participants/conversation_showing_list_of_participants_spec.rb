require 'rails_helper'

RSpec.feature "ConversationShowingListOfParticipants", type: :feature do
  context 'not signed in' do
    let(:conversation) { create :conversation }
    it 'should redirect to sign in page' do
      visit conversation_participations_path(conversation)

      expect(current_path).to eq new_user_session_path
    end
  end

  context 'signed in' do
    describe 'permissions who is allowed to see what message' do
      let!(:me) do
        create :user, :confirmed, :free, username: 'something',
          avatar: open_image('me.jpg'),
          first_name: 'Serge',
          email: 'me@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:collaborator1) do
        create :user, :confirmed, :free, username: 'collaborator1',
          avatar: open_image('collaborator1.jpg'),
          first_name: 'Vasia',
          email: 'collaborator1@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:collaborator2) do
        create :user, :confirmed, :free, username: 'collaborator2',
          avatar: open_image('collaborator2.jpg'),
          first_name: 'Petia',
          email: 'collaborator2@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      context 'I sign in' do
        before do
          login_as me
        end

        context 'I am a part of conversation' do
          let!(:conversation1) { create :conversation }
          let!(:participation1) { create :participation, conversation: conversation1, user: me }
          let!(:participation2) { create :participation, conversation: conversation1, user: collaborator1 }
          let!(:participation3) { create :participation, conversation: conversation1, user: collaborator2 }

          before do
            visit conversation_messages_path(conversation1)
            click_on 'Participants'
          end

          it 'should open the participants page for me' do
            expect(current_path).to eq conversation_participations_path(conversation1)
          end

          it 'should display names' do
            expect(page).to have_content 'Serge'
            expect(page).to have_content 'Vasia'
            expect(page).to have_content 'Petia'
          end

          it 'should display avatars' do
            expect(page).to have_css("img[src*='me.jpg']")
            expect(page).to have_css("img[src*='collaborator1.jpg']")
            expect(page).to have_css("img[src*='collaborator2.jpg']")
          end
        end

        context 'I am not a part of conversation' do
          let!(:conversation2) { create :conversation }
          let!(:participation4) { create :participation, conversation: conversation2, user: collaborator1 }
          let!(:participation5) { create :participation, conversation: conversation2, user: collaborator2 }

          before do
            visit conversation_participations_path(conversation2)
          end

          it 'should not allow me to read someone elses conversation participants' do
            expect(current_path).to eq conversations_path
          end
        end
      end
    end
  end
end
