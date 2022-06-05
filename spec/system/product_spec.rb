require 'rails_helper'
RSpec.describe 'Product management function', type: :system do
  before do
@user = User.create!(id:8, name: 'user8', email: "user8@gmail.com", password: "12345678", confirmed_at: DateTime.now)

    FactoryBot.create(:product)
    FactoryBot.create(:product1)
    FactoryBot.create(:product2)


  end

#okkkkkkkkkk
  describe 'New product creation function' do
    context 'When creating a new product' do
      it 'The created Product is displayed' do
        #user2 =  FactoryBot.create(:user_id: user2.id, name: 'user', email: 'user@gmail.com', password: 'userpassword', password_confirmation: 'userpassword', confirmed_at: DateTime.now)
        # visit "/users/sign_in"
        visit "/products/new"
        find("#user_email").set(@user.email)
        find("#user_password").set("12345678")
        click_button 'Connecté(e)'
      find("#product_title").set('Home1')
      find("#product_description").set("Nice House")
      find("#product_localisation").set("Cotonou")
      find("#product_availability").select('Libre')
      find("#product_remarks").set("Blablabla")
      find("#product_cost").set("25000")
         click_on 'Poster le nouveau produit'
       expect(page).to have_content 'Product'
      end
    end
 end

#
#
#
# #okkkkkkkkkk doublon
#   describe 'product list screen' do
#   context 'When transitioning to the list screen' do
#     it 'The created product list is displayed' do
#       #product = FactoryBot.create(:product, title: 'Nice Home')
#     #  visit products_path
#       visit "/products/new"
#       find("#user_email").set(@user.email)
#       find("#user_password").set("12345678")
#       click_button 'Connecté(e)'
#       find("#product_title").set('Home1')
#           find("#product_description").set("Nice House")
#           find("#product_localisation").set("Cotonou")
#           find("#product_availability").set("Libre")
#           find("#product_remarks").set("Blablabla")
#           find("#product_cost").set("25000")
#              click_on 'Publish New Product'
#       expect(page).to have_content 'Product'
#     end
#   end
# end





  describe 'Detailed display function' do
     context 'When transitioned to any product showing details screen' do
       it 'Able To Edit  Content' do
        # FactoryBot.create(:product)
         visit products_path
         find("#user_email").set("user8@gmail.com")
         find("#user_password").set("12345678")
         click_button 'Connecté(e)'

          visit '/products/2/edit'
          fill_in "Titre", with: 'New House'
          click_button 'Modifier'
        expect(page).to have_content 'Product'
       end
     end
  end

  #
  #
  #
  #



    #
    describe 'Detailed display function' do
       context 'When transitioned to The product details screen' do
         it 'Able To Delete product' do
           #product = FactoryBot.create(:product, title: 'Nice Home')
           @product = Product.create!(id:4, title: 'Home', description: 'House is nice', localisation: 'Coto', availability: 'Libre', remarks: 'Blololo', cost: '258741', user_id: @user.id)
         visit products_path
         find("#user_email").set('user8@gmail.com')
         find("#user_password").set("12345678")
         click_button 'Connecté(e)'

         click_on "Supprimer"
        #sleep 5
        a = page.driver.browser.switch_to.alert
          a.accept

          expect(page).to have_content 'Product'
         end
       end
    end


#okkkkkkkkkk
  describe 'Detailed list in descending order of products' do
      context 'When products are arranged in descending order of cost' do
        it 'List of Products sorted in descending order of cost' do
          visit products_path
          find("#user_email").set(@user.email)
          find("#user_password").set("12345678")
          click_button 'Connecté(e)'
          click_on 'Trier par Coût du Loyer'
          assert Product.all.order('cost desc')
        end
      end
    end

    describe 'Detailed list in descending order of products' do
        context 'When products are arranged in descending order of Localisation' do
          it 'List of Products sorted in descending order of localisation' do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            click_on 'Trier par Localité'
            assert Product.all.order('localisation desc')
          end
        end
      end

      describe 'Detailed list in descending order of products' do
          context 'When products are arranged in descending order of availability' do
            it 'List of Products sorted in descending order of availability' do
              visit products_path
              find("#user_email").set(@user.email)
              find("#user_password").set("12345678")
              click_button 'Connecté(e)'
              click_on 'Trier par Disponibilité'
              assert Product.all.order('availability desc')
            end
          end
        end
#
#

#okkkkkkkkkk
    context 'When searching with the scope method' do
          it "You can search for titles with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            fill_in 'search_title', with: 'House'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Product'
          end

          it "You can search the localisation with the scope method" do
          visit products_path
          find("#user_email").set(@user.email)
          find("#user_password").set("12345678")
          click_button 'Connecté(e)'
            fill_in 'search_localisation', with: 'Avrankou'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Product'
          end

          it "You can search the cost with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            fill_in 'search_cost', with: '50000'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Product'
          end
          it "You can search the availability with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            select 'Libre', from: 'search_availability'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Product'
          end
          it "Both title and localisation can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            fill_in 'search_title', with: 'House'
            fill_in 'search_localisation', with: 'Avrankou'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Product'
          end
          it "Both title and availability can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            fill_in 'search_title', with: 'House'
            select 'Libre', from: 'search_availability'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Product'
          end

          it "Both localisation and availability can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            fill_in 'search_localisation', with: 'Avrankou'
            select 'Libre', from: 'search_availability'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Product'
          end

          it "Both localisation and cost can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            fill_in 'search_localisation', with: 'Avrankou'
            fill_in 'search_cost', with: '50000'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Product'
          end

          it "All localisation availability and cost can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            fill_in 'search_localisation', with: 'Avrankou'
            select 'Libre', from: 'search_availability'
            fill_in 'search_cost', with: '50000'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Product'
          end
        end
end
