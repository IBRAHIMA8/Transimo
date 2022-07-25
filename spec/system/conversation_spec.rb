require 'rails_helper'
RSpec.describe 'Conversation function', type: :system do
  before do
  @userconv1 = User.create!(id:11, name: 'userconv1', email: "userconv1@gmail.com", password: "12345678", confirmed_at: DateTime.now)

  @userconv2 = User.create!(id:12, name: 'userconv2', email: "userconv2@gmail.com", password: "12345678", confirmed_at: DateTime.now)

  conversation1 = Conversation.create!(id:1, sender_id: @userconv1.id, recipient_id: @userconv2.id )
  end

  describe 'New message function' do
    context 'The created Message is displayed' do
      it 'After be connected, user can create a conversation' do
        
        visit new_user_session_path
        find("#user_email").set("userconv1@gmail.com")
        find("#user_password").set("12345678")
        click_button 'Connecté(e)'

        visit "/conversations/1/messages"
         find("#message_body").set("Salut, Votre maison est toujours disponible?")
         click_on 'Envoyer'
       expect(page).to have_content 'Salut, Votre maison est toujours disponible?'
      end
    end
  end
end
