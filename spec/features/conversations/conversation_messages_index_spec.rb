require 'rails_helper'

RSpec.feature "Conversations messages index", type: :feature do
  context 'not signed in' do
    let(:conversation) { create :conversation }
    it 'should redirect to sign in page' do
      visit conversation_messages_path(conversation)

      expect(current_path).to eq new_user_session_path
    end
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

      let!(:message1) { create :message, body: 'message from me to collaborator 1', conversation: conversation1, sender: me }
      let!(:message2) { create :message, body: 'message to me from collaborator 2', conversation: conversation2, sender: collaborator2 }
      let!(:message3) { create :message, body: 'message from collaborator 2 to collaborator 1', conversation: conversation3, sender: collaborator2 }
      let!(:message4) { create :message, body: 'message from collaborator2 to a stranger', conversation: conversation4, sender: collaborator2 }

      let!(:reading1_1) { create :reading, message: message1, user: me }
      let!(:reading1_1) { create :reading, message: message1, user: collaborator1 }

      let!(:reading2_2) { create :reading, message: message2, user: me }
      let!(:reading2_2) { create :reading, message: message2, user: collaborator2 }

      let!(:reading3_1) { create :reading, message: message3, user: collaborator1 }
      let!(:reading3_2) { create :reading, message: message3, user: collaborator2 }

      let!(:reading4_1) { create :reading, message: message4, user: stranger }
      let!(:reading4_2) { create :reading, message: message4, user: collaborator2 }

      context 'I sign in' do
        before do
          login_as me
          visit conversation_messages_path(conversation1)
        end

        it 'should let me see my messages' do
          expect(page).to have_content 'message from me to collaborator 1'
        end

        it 'should not show other messages that are parts of my other conversations' do
          expect(page).to have_no_content 'message to me from collaborator 2'
        end

        it 'should not let me see someone elses messages' do
          expect(page).to have_no_content 'message from collaborator 2 to collaborator 1'
          expect(page).to have_no_content 'message from collaborator2 to a stranger'
        end
      end

      context 'my collaborator1 signs in' do
        before do
          login_as collaborator1
          visit conversation_messages_path(conversation1)
        end

        it 'should let him see his messages' do
          expect(page).to have_content 'message from me to collaborator 1'
        end

        it 'should not show messages from other conversations' do
          expect(page).to have_no_content 'message from collaborator 2 to collaborator 1'
        end

        it 'should not let him see someone elses messages' do
          expect(page).to have_no_content 'message to me from collaborator 2'
          expect(page).to have_no_content 'message from collaborator2 to a stranger'
        end
      end

      context 'my collaborator2 signs in' do
        before do
          login_as collaborator2
          visit conversation_messages_path(conversation1)
        end

        it 'should not let him see a conversation of which he is not part of' do
          expect(page).to have_no_content 'message from me to collaborator 0'
        end

        it 'should redirect to conversations index' do
          expect(current_path).to eq conversations_path
        end
      end
    end

    describe 'displaying senders" names' do
      let!(:me) do
        create :user, :confirmed, :free, username: 'something',
          first_name: 'Serge',
          last_name: 'Vinogradoff',
          email: 'me@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:collaborator1) do
        create :user, :confirmed, :free, username: 'collaborator1',
          first_name: 'Collaborator',
          last_name: 'One',
          email: 'collaborator1@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:collaborator2) do
        create :user, :confirmed, :free, username: 'collaborator2',
          first_name: 'Collaborator',
          last_name: 'Two',
          email: 'collaborator2@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:stranger) do
        create :user, :confirmed, :free, username: 'stranger',
          first_name: 'Stranger',
          last_name: 'Tits',
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

      let!(:message1) { create :message, conversation: conversation1, sender: me }
      let!(:message2) { create :message, conversation: conversation2, sender: collaborator2 }
      let!(:message3) { create :message, conversation: conversation3, sender: collaborator2 }
      let!(:message4) { create :message, conversation: conversation4, sender: collaborator2 }

      let!(:reading1_1) { create :reading, message: message1, user: me }
      let!(:reading1_1) { create :reading, message: message1, user: collaborator1 }

      let!(:reading2_2) { create :reading, message: message2, user: me }
      let!(:reading2_2) { create :reading, message: message2, user: collaborator2 }

      let!(:reading3_1) { create :reading, message: message3, user: collaborator1 }
      let!(:reading3_2) { create :reading, message: message3, user: collaborator2 }

      let!(:reading4_1) { create :reading, message: message4, user: stranger }
      let!(:reading4_2) { create :reading, message: message4, user: collaborator2 }

      context 'I sign in' do
        before do
          login_as me
          visit conversation_messages_path(conversation1)
        end

        it 'should let me see my name when I am a sender' do
          expect(page).to have_content 'Serge Vinogradoff'
        end

        it 'should not let me see my name when someone else was the sender' do
          expect(page).to have_no_content 'Collaborator One'
        end

        it 'should not show senders of messages of other conversations' do
          expect(page).to have_no_content 'Collaborator Two'
        end

        it 'should not see names of people who sent messages to someone else' do
          expect(page).to have_no_content 'Stranger Tits'
        end
      end

      context 'my collaborator1 signs in' do
        before do
          login_as collaborator1
          visit conversation_messages_path(conversation1)
        end

        it 'should let him see names of senders of messages sent to him' do
          expect(page).to have_content 'Serge Vinogradoff'
        end

        it 'should not show his name if he did not send anything' do
          expect(page).to have_no_content 'Collaborator One'
        end

        it 'should not show names of people with whom he talks in other conversations' do
          expect(page).to have_no_content 'Collaborator Two'
        end

        it 'should not let him see names of people with whom he did not talk' do
          expect(page).to have_no_content 'Stranger Tits'
        end
      end
    end

    describe 'displaying last sender"s photo when I see their messages' do
      let!(:me) do
        create :user, :confirmed, :free, username: 'something',
          avatar: open_image('me.jpg'),
          email: 'me@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:collaborator1) do
        create :user, :confirmed, :free, username: 'collaborator1',
          avatar: open_image('collaborator1.jpg'),
          email: 'collaborator1@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:collaborator2) do
        create :user, :confirmed, :free, username: 'collaborator2',
          avatar: open_image('collaborator2.jpg'),
          email: 'collaborator2@gmail.com',
          password: 'rediculouslycomplexpassword54321',
          password_confirmation: 'rediculouslycomplexpassword54321'
      end

      let!(:stranger) do
        create :user, :confirmed, :free, username: 'stranger',
          avatar: open_image('stranger.jpg'),
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

      let!(:message1) { create :message, conversation: conversation1, sender: me }
      let!(:message2) { create :message, conversation: conversation2, sender: collaborator2 }
      let!(:message3) { create :message, conversation: conversation3, sender: collaborator2 }
      let!(:message4) { create :message, conversation: conversation4, sender: collaborator2 }

      let!(:reading1_1) { create :reading, message: message1, user: me }
      let!(:reading1_1) { create :reading, message: message1, user: collaborator1 }

      let!(:reading2_2) { create :reading, message: message2, user: me }
      let!(:reading2_2) { create :reading, message: message2, user: collaborator2 }

      let!(:reading3_1) { create :reading, message: message3, user: collaborator1 }
      let!(:reading3_2) { create :reading, message: message3, user: collaborator2 }

      let!(:reading4_1) { create :reading, message: message4, user: stranger }
      let!(:reading4_2) { create :reading, message: message4, user: collaborator2 }

      context 'I sign in' do
        before do
          login_as me
          visit conversation_messages_path(conversation1)
        end

        it 'should let me see my name when I was the one who sent the message in the conversation' do
          expect(page).to have_css("img[src*='me.jpg']")
        end

        it 'should not show me photos of people I talk to if they did not send anything' do
          expect(page).to have_no_css("img[src*='collaborator1.jpg']")
        end

        it 'should not show the people with whom I talk in other conversations' do
          expect(page).to have_no_css("img[src*='collaborator2.jpg']")
        end

        it 'should not let me see photos of people who talk to someone else and not to me' do
          expect(page).to have_no_css("img[src*='stranger.jpg']")
        end
      end

      context 'my collaborator1 signs in' do
        before do
          login_as collaborator1
          visit conversation_messages_path(conversation1)
        end

        it 'should let him see photo of senders of messages sent to him' do
          expect(page).to have_css("img[src*='me.jpg']")
        end

        it 'should not show him his photo if he did not send anything' do
          expect(page).to have_no_css("img[src*='collaborator1.jpg']")
        end

        it 'should not show him photos of people with whom he talks in other conversations' do
          expect(page).to have_no_css("img[src*='collaborator2.jpg']")
        end

        it 'should not let him see photos of senders of someone elses messages' do
          expect(page).to have_no_css("img[src*='stranger.jpg']")
        end
      end
    end

    describe 'I see all messages that we sent to one another in the chat' do
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

      let!(:message1) { create :message, body: 'my message to collaborator1', conversation: conversation1, sender: me, created_at: 3.days.ago }
      let!(:message2) { create :message, body: 'reply from collaborator to me', conversation: conversation1, sender: collaborator1, created_at: 2.days.ago }

      let!(:reading1_1) { create :reading, message: message1, user: me }
      let!(:reading1_1) { create :reading, message: message1, user: collaborator1 }

      let!(:reading2_2) { create :reading, message: message2, user: me }
      let!(:reading2_2) { create :reading, message: message2, user: collaborator1 }

      context 'I sign in' do
        before do
          login_as me
          visit conversation_messages_path(conversation1)
        end

        it 'should let me see the message he sent' do
          expect(page).to have_content 'reply from collaborator to me'
        end

        it 'should not let me see the message I sent' do
          expect(page).to have_content 'my message to collaborator1'
        end
      end

      context 'my collaborator1 signs in' do
        before do
          login_as collaborator1
          visit conversation_messages_path(conversation1)
        end

        it 'should let him see his message' do
          expect(page).to have_content 'reply from collaborator to me'
        end

        it 'should let him see my message to him' do
          expect(page).to have_content 'my message to collaborator1'
        end
      end
    end

    describe 'displaying messages as active when they are unread' do
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

      let!(:message1) { create :message, body: 'my message to collaborator1', conversation: conversation1, sender: me, created_at: 3.days.ago }
      let!(:message2) { create :message, body: 'reply from collaborator to me', conversation: conversation1, sender: collaborator1, created_at: 2.days.ago }

      describe 'last message' do
        context 'I read, collaborator read' do
          let!(:reading1_1) { create :reading, read: true, message: message1, user: me }
          let!(:reading1_2) { create :reading, read: true, message: message1, user: collaborator1 }
          let!(:reading2_1) { create :reading, read: true, message: message2, user: me }
          let!(:reading2_2) { create :reading, read: true, message: message2, user: collaborator1 }

          context 'I sign in' do
            before do
              login_as me
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_no_css '.card-body.bg-light'
            end
          end

          context 'my collaborator1 signs in' do
            before do
              login_as collaborator1
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_no_css '.card-body.bg-light'
            end
          end
        end

        context 'I read, collaborator did not read' do
          let!(:reading1_1) { create :reading, read: true, message: message1, user: me }
          let!(:reading1_2) { create :reading, read: true, message: message1, user: collaborator1 }
          let!(:reading2_1) { create :reading, read: true, message: message2, user: me }
          let!(:reading2_2) { create :reading, read: false, message: message2, user: collaborator1 }

          context 'I sign in' do
            before do
              login_as me
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as not active' do
              expect(page).to have_no_css '.card-body.bg-light'
            end
          end

          context 'my collaborator1 signs in' do
            before do
              login_as collaborator1
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_css '.card-body.bg-light'
            end
          end
        end

        context 'I did not read, collaborator read' do
          let!(:reading1_1) { create :reading, read: true, message: message1, user: me }
          let!(:reading1_2) { create :reading, read: true, message: message1, user: collaborator1 }
          let!(:reading2_1) { create :reading, read: false, message: message2, user: me }
          let!(:reading2_2) { create :reading, read: true, message: message2, user: collaborator1 }

          context 'I sign in' do
            before do
              login_as me
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_css '.card-body.bg-light'
            end
          end

          context 'my collaborator1 signs in' do
            before do
              login_as collaborator1
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_no_css '.card-body.bg-light'
            end
          end
        end

        context 'I did not read, collaborator did not read' do
          let!(:reading1_1) { create :reading, read: true, message: message1, user: me }
          let!(:reading1_2) { create :reading, read: true, message: message1, user: collaborator1 }
          let!(:reading2_1) { create :reading, read: false, message: message2, user: me }
          let!(:reading2_2) { create :reading, read: false, message: message2, user: collaborator1 }

          context 'I sign in' do
            before do
              login_as me
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_css '.card-body.bg-light'
            end
          end

          context 'my collaborator1 signs in' do
            before do
              login_as collaborator1
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_css '.card-body.bg-light'
            end
          end
        end
      end

      describe 'non-last message' do
        context 'I read, collaborator read' do
          let!(:reading1_1) { create :reading, read: true, message: message1, user: me }
          let!(:reading1_2) { create :reading, read: true, message: message1, user: collaborator1 }
          let!(:reading2_1) { create :reading, read: true, message: message2, user: me }
          let!(:reading2_2) { create :reading, read: true, message: message2, user: collaborator1 }

          context 'I sign in' do
            before do
              login_as me
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_no_css '.card-body.bg-light'
            end
          end

          context 'my collaborator1 signs in' do
            before do
              login_as collaborator1
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_no_css '.card-body.bg-light'
            end
          end
        end

        context 'I read, collaborator did not read' do
          let!(:reading1_1) { create :reading, read: true, message: message1, user: me }
          let!(:reading1_2) { create :reading, read: false, message: message1, user: collaborator1 }
          let!(:reading2_1) { create :reading, read: true, message: message2, user: me }
          let!(:reading2_2) { create :reading, read: true, message: message2, user: collaborator1 }

          context 'I sign in' do
            before do
              login_as me
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_no_css '.card-body.bg-light'
            end
          end

          context 'my collaborator1 signs in' do
            before do
              login_as collaborator1
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_css '.card-body.bg-light'
            end
          end
        end

        context 'I did not read, collaborator read' do
          let!(:reading1_1) { create :reading, read: false, message: message1, user: me }
          let!(:reading1_2) { create :reading, read: true, message: message1, user: collaborator1 }
          let!(:reading2_1) { create :reading, read: true, message: message2, user: me }
          let!(:reading2_2) { create :reading, read: true, message: message2, user: collaborator1 }

          context 'I sign in' do
            before do
              login_as me
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_css '.card-body.bg-light'
            end
          end

          context 'my collaborator1 signs in' do
            before do
              login_as collaborator1
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_no_css '.card-body.bg-light'
            end
          end
        end

        context 'I did not read, collaborator did not read' do
          let!(:reading1_1) { create :reading, read: false, message: message1, user: me }
          let!(:reading1_2) { create :reading, read: false, message: message1, user: collaborator1 }
          let!(:reading2_1) { create :reading, read: true, message: message2, user: me }
          let!(:reading2_2) { create :reading, read: true, message: message2, user: collaborator1 }

          context 'I sign in' do
            before do
              login_as me
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_css '.card-body.bg-light'
            end
          end

          context 'my collaborator1 signs in' do
            before do
              login_as collaborator1
              visit conversation_messages_path(conversation1)
            end

            it 'should show conversation as active' do
              expect(page).to have_css '.card-body.bg-light'
            end
          end
        end
      end
    end

  end # end sign in
end # end test
