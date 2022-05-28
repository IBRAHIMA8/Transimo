require 'rails_helper'
RSpec.describe 'Conversation function', type: :system do
  before do
  #   @user4 =  FactoryBot.create(:user, name: 'adouke4',
  #                              email: 'adouke4@gmail.com',
  #                              password: 'password4',
  #                              password_confirmation: 'password4',
  #                              confirmed_at: DateTime.now)
  #
  # @user5 =  FactoryBot.create(:user, name: 'adouke5',
  #                            email: 'adouke5@gmail.com',
  #                            password: 'password5',
  #                            password_confirmation: 'password5',
  #                            confirmed_at: DateTime.now)

    @user6 = User.create!(id:6, name: 'user6', email: "user6@gmail.com", password: "12345678", confirmed_at: DateTime.now)

    @user7 = User.create!(id:7, name: 'user7', email: "user7@gmail.com", password: "12345678", confirmed_at: DateTime.now)

    # visit '/session/new'
    # fill_in 'user[email]', with: "user6@gmail.com"
    # fill_in 'user[password]', with: '12345678'
    # click_button 'Log in'




        visit new_session_path
        find("#user_email").set(@user6.email)
        find("#user_password").set("12345678")
        click_button 'Log in'
        # expect(page).to have_content 'Product'


    conversation1 = Conversation.create!(
     sender_id: @user6.id,
     recipient_id: @user7.id
    )
  end
  describe 'New message function' do
    context 'Creating a conversation' do
      it 'The created Message is displayed' do
        visit conversations_path
        click_on 'Message'
         fill_in "message[body]", with: 'Salut, Votre maison est toujours disponible?'
         click_on 'send a message'
       expect(page).to have_content 'Salut, Votre maison est toujours disponible?'
      end
    end
  end
end
