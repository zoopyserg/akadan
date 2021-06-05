require 'rails_helper'

RSpec.feature "MessageChainsIndices", type: :feature do
  context 'not signed in' do
    it 'should redirect to sign in page' do
      visit message_chains_path

      expect(current_path).to eq new_user_session_path
    end
  end

  #todo: maybe check https://github.com/mailboxer/mailboxer
  #but need to check how it works
  context 'signed in' do
    let!(:me) { create :user, :confirmed, :free, username: 'something', email: 'jack.daniels@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:collaborator) { create :user, :confirmed, :free, username: 'collaborator', email: 'duboid@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:collaborator2) { create :user, :confirmed, :free, username: 'collaborator2', email: 'osvdfs034@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }
    let!(:stranger) { create :user, :confirmed, :free, username: 'stranger', email: 'sombksksjdvn@gmail.com', password: 'rediculouslycomplexpassword54321', password_confirmation: 'rediculouslycomplexpassword54321' }

    let!(:message_chain1) { create :message_chain }

    let!(:message_chain2) { create :message_chain }

    let!(:message_chain3) { create :message_chain }

    let!(:message_chain4) { create :message_chain }

    let!(:message1) { create :message, text: 'message from me', message_chain: message_chain1, sender: me, receiver: collaborator }

    let!(:message2) { create :message, text: 'message to me', message_chain: message_chain2, sender: collaborator2, receiver: me }

    let!(:message3) { create :message, text: 'message from one collaborator to another', message_chain: message_chain3, sender: collaborator2, receiver: collaborator1 }

    let!(:message4) { create :message, text: 'message from someone else to a stranger', message_chain: message_chain4, sender: collaborator, receiver: stranger }

    describe 'permissions who is allowed to see what message' do
      context 'I sign in' do
        before do
          visit root_path
          sign_in('jack.daniels@gmail.com', 'rediculouslycomplexpassword54321') # me
          visit message_chains_path
        end

        it 'should let me see my messages' do
          expect(page).to have_content 'message from me'
          expect(page).to have_content 'message to me'
        end

        it 'should not let me see someone elses messages' do
          expect(page).to have_no_content 'message from one collaborator to another'
          expect(page).to have_no_content 'message from someone else to a stranger'
        end
      end

      context 'my collaborator signs in' do
        before do
          visit root_path
          sign_in('duboid@gmail.com', 'rediculouslycomplexpassword54321') # me
          visit message_chains_path
        end

        it 'should let him see his messages' do
          expect(page).to have_content 'message from me'
          expect(page).to have_content 'message from one collaborator to another'
        end

        it 'should not let him see someone elses messages' do
          expect(page).to have_content 'message to me'
          expect(page).to have_content 'message from someone else to a stranger'
        end
      end

      context 'my collaborator #2 signs in' do
        before do
          visit root_path
          sign_in('osvdfs034@gmail.com', 'rediculouslycomplexpassword54321') # me
          visit message_chains_path
        end

        it 'should let him see his messages' do
          expect(page).to have_content 'message to me'
          expect(page).to have_content 'message from one collaborator to another'
        end

        it 'should not let him see someone elses messages' do
          expect(page).to have_content 'message from me'
          expect(page).to have_content 'message from someone else to a stranger'
        end
      end

      context 'a stranger signs in' do
        before do
          visit root_path
          sign_in('sombksksjdvn@gmail.com', 'rediculouslycomplexpassword54321') # me
          visit message_chains_path
        end

        it 'should let him see his messages' do
          expect(page).to have_no_content 'message from someone else to a stranger'
        end

        it 'should not let me see someone elses messages' do
          expect(page).to have_content 'message from me'
          expect(page).to have_content 'message to me'
          expect(page).to have_content 'message from one collaborator to another'
        end
      end
    end
  end
end
