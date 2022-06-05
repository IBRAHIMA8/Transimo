require 'rails_helper'
RSpec.describe 'User registration / login / logout function', type: :system do
  def user_login
    visit new_user_session_path
    # fill_in 'session[email]', with: 'user@gmail.com'
    # fill_in 'session[password]', with: '00000000'
    find("#user_email").set('usernew@gmail.com')
    find("#user_password").set('00000000')
    click_button 'Connecté(e)'
  end

  def admin_user_login
    visit new_user_session_path
    # fill_in 'session[email]', with: 'admin@gmail.com'
    # fill_in 'session[password]', with: '99999999'
    find("#user_email").set('admin@gmail.com')
    find("#user_password").set('99999999')
    click_button 'Connecté(e)'

    #@user = User.create!(id:1, name: 'user1', email: "user@gmail.com", password: "12345678", confirmed_at: DateTime.now)

    # FactoryBot.create(:user)
    # FactoryBot.create(:admin_user)
  end



#okkkkkkkkkk

  # describe 'User registration test' do
  #     context 'No user data and no login' do
  #         it 'should register new user' do
  #         visit new_user_registration_path
  #         fill_in 'user[name]', with: 'example'
  #         fill_in 'user[email]', with: 'user@example.com'
  #         fill_in 'user[password]', with: '00000000'
  #         #fill_in 'user[password_confirmation]', with: '00000000'
  #         #find("#confirmed_at").set(DateTime.now)
  #         # find("#user_email").set(@user.email)
  #         # find("#user_password").set'00000000'
  #         # fill_in 'Password confirmation', with: '00000000'
  #         click_on 'Sign up'
  #         expect(page).to have_content 'Products'
  #         #expect(current_path).to eq products_path
  #       end
  #     it 'Test for jumping to the login screen when you are not logged in.' do
  #       visit products_path
  #       expect(current_path).not_to eq products_path
  #       expect(page).to have_content 'Connecté(e)'
  #        end
  #      end
  #    end







<<<<<<< HEAD
describe 'Session functionality testing' do
  before do
    #@user = FactoryBot.create(:user1)
    @user = User.create!(id:8, name: 'user8', email: "user8@gmail.com", password: "12345678", confirmed_at: DateTime.now)
    user_login
  end



  # context 'If you have user data while you are not logged in.' do
  #   it 'Being able to Connecté(e)' do
  #     expect(page).to have_content 'There is no product created by this user'
  #   end
  # end

  context 'Connecté(e) as general user.' do
    it 'You can jump to your own page' do
      visit root_path
      #find("#Ma page").click
      #click_on 'Product List'
      #find("#Product List").click
      #find("#Ma page").click
      click_button 'Ma page'
       expect(current_path).to eq user_path
    end
  end
end




  #
  #   it 'Being able to log out' do
  #     click_link 'Se déconnecter'
  #     page.driver.browser.switch_to.alert.accept
  #     expect(current_path).to eq new_session_path
  #   end
  # end
#end
=======
# describe 'Session functionality testing' do
#   before do
#     #@user = FactoryBot.create(:user1)
#     @user = User.create!(id:8, name: 'user8', email: 'usernew@gmail.com', password: '00000000', confirmed_at: DateTime.now)
#     user_login
#   end
#
>>>>>>> a18ee69dace52d41c5220cc7c47d377b2d496544
#
#
#
#
#   context 'Log in as general user.' do
#     it 'You can jump to your own page' do
#       click_on 'Ma page'
#       #visit "/products"
#       #find("#Ma page").click
#       #click_on 'Product List'
#       #find("#Product List").click
#       #find("#Ma page").click
#
#        expect(page).to have_content("user8")
#     end
#   end
# end
#
<<<<<<< HEAD
#     context 'Connecté(e) as a general user' do
#       it 'General users cannot access the management screen' do
#         user_login
#         visit admin_users_path
#         expect(current_path).to eq products_path
#       end
=======
#
#
#
#   #
#     it 'Being able to log out' do
#       click_link 'Se déconnecter'
#       page.driver.browser.switch_to.alert.accept
#       expect(current_path).to eq new_session_path
>>>>>>> a18ee69dace52d41c5220cc7c47d377b2d496544
#     end
  # end
#end
#
#
#
#
describe 'Management screen test' do
    before do
      @user = FactoryBot.create(:user)
      @admin_user = FactoryBot.create(:admin_user)
    end
end
    context 'Log in as a general user' do
      it 'General users cannot access the management screen' do
        admin_user_login
        visit admin_user_login
        expect(current_path).to eq admin_users_path
      end
    end

#     context 'You are logged in as an administrator' do
#       before do
#         admin_user_login
#         click_link 'Management'
#       end
#
#       it 'Administrators should be able to access the management screen' do
#         expect(current_path).to eq admin_users_path
#       end
#
#       it 'Administrators can register new users' do
#         visit new_user_registration_path
#         #click_link 'New user registration'
#         fill_in 'user[name]', with: 'adminpower'
#         fill_in 'user[email]', with: 'adminpower@gmail.com'
#         fill_in 'user[password]', with: '654321'
#         fill_in 'user[password_confirmation]', with: '654321'
#         click_button "Register"
#         visit admin_users_path
#         expect(page).to have_content 'adminpower'
#       end
#
#       it 'The administrator should have access to the user\'s details screen' do
#         click_link 'admin'
#         expect(current_path).to eq user_path(2)
#       end
#
#       it 'The administrator can edit the user from the user edit screen' do
#         click_link 'Edit/Delete', href: edit_admin_user_path(1)
#         fill_in 'user[name]', with: 'user'
#         fill_in 'user[password]', with: '00000000'
#         fill_in 'user[password_confirmation]', with: '00000000'
#         click_button "Approve"
#           sleep 1
#         expect(page).to have_content 'user'
#       end
#
#       it 'Administrators can delete users' do
#         click_link 'Edit/Delete', href: edit_admin_user_path(1)
#         click_link 'Delete user data'
#         page.driver.browser.switch_to.alert.accept
#         expect(page).not_to have_content "test"
#       end
#     end
#  end
end
