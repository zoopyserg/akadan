require 'rails_helper'

RSpec.feature "BackFromParticipantsToConversation Button", type: :feature do
  context 'not signed in' do
    # skipping because tested
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

      let!(:conversation1) { create :conversation }
      let!(:participation1) { create :participation, conversation: conversation1, user: me }
      let!(:participation2) { create :participation, conversation: conversation1, user: collaborator1 }
      let!(:participation3) { create :participation, conversation: conversation1, user: collaborator2 }

      context 'I sign in' do
        before do
          login_as me
        end

        context 'I am a part of conversation' do
          before do
            visit conversation_participations_path(conversation1)
            click_on 'Back'
          end

          it 'return me back to conversation' do
            expect(current_path).to eq conversation_path(conversation1)
          end
        end
      end
    end
  end
end
