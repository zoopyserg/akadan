require 'rails_helper'

RSpec.feature "ConversationOpenMessagesButtons", type: :feature do
  context 'not signed in' do
    # skipping because it's tested
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

      let!(:conversation1) { create :conversation }

      let!(:participation1_1) { create :participation, conversation: conversation1, user: me }
      let!(:participation1_2) { create :participation, conversation: conversation1, user: collaborator1 }

      let!(:message1) { create :message, conversation: conversation1, sender: me }

      let!(:reading1_1) { create :reading, message: message1, user: me }
      let!(:reading1_1) { create :reading, message: message1, user: collaborator1 }

      context 'I sign in' do
        before do
          login_as me
          visit conversations_path
          within '.conversation' do
            click_on 'Message'
          end
        end

        it 'should open the conversation for me' do
          expect(current_path).to eq conversation_messages_path(conversation1)
        end
      end
    end
  end
end
