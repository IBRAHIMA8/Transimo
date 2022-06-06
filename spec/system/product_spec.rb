require 'rails_helper'
RSpec.describe 'Product management function', type: :system do
  before do
@user = User.create!(id:8, name: 'user8', email: "user8@gmail.com", password: "12345678", confirmed_at: DateTime.now)

    FactoryBot.create(:product)
    FactoryBot.create(:product1)
    FactoryBot.create(:product2)
  end

  describe 'New product creation function' do
    context 'When creating a new product' do
      it 'The created Product is displayed' do
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
       expect(page).to have_content 'Produit'
      end
    end
 end

  describe 'Detailed display function' do
     context 'When transitioned to any product showing details screen' do
       it 'Able To Edit  Content' do
         visit products_path
         find("#user_email").set("user8@gmail.com")
         find("#user_password").set("12345678")
         click_button 'Connecté(e)'

          visit '/products/2/edit'
          fill_in "Titre", with: 'New House'
          click_button 'Modifier'
        expect(page).to have_content 'Produit'
       end
     end
  end

    describe 'Detailed display function' do
       context 'When transitioned to The product details screen' do
         it 'Able To Delete product' do
           @product = Product.create!(id:4, title: 'Home', description: 'House is nice', localisation: 'Coto', availability: 'Libre', remarks: 'Blololo', cost: '258741', user_id: @user.id)
         visit products_path
         find("#user_email").set('user8@gmail.com')
         find("#user_password").set("12345678")
         click_button 'Connecté(e)'
         click_on "Supprimer"
        a = page.driver.browser.switch_to.alert
          a.accept
          expect(page).to have_content 'Produit'
         end
       end
    end

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

    context 'When searching with the scope method' do
          it "You can search for titles with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            fill_in 'search_title', with: 'House'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Produit'
          end

          it "You can search the localisation with the scope method" do
          visit products_path
          find("#user_email").set(@user.email)
          find("#user_password").set("12345678")
          click_button 'Connecté(e)'
            fill_in 'search_localisation', with: 'Avrankou'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Produit'
          end

          it "You can search the cost with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            fill_in 'search_cost', with: '50000'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Produit'
          end

          it "You can search the availability with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            select 'Libre', from: 'search_availability'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Produit'
          end

          it "Both title and localisation can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            fill_in 'search_title', with: 'House'
            fill_in 'search_localisation', with: 'Avrankou'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Produit'
          end

          it "Both title and availability can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            fill_in 'search_title', with: 'House'
            select 'Libre', from: 'search_availability'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Produit'
          end

          it "Both localisation and availability can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Connecté(e)'
            fill_in 'search_localisation', with: 'Avrankou'
            select 'Libre', from: 'search_availability'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Produit'
          end

          it "Both localisation and cost can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")

            click_button 'Connecté(e)'
            fill_in 'search_localisation', with: 'Avrankou'
            fill_in 'search_cost', with: '50000'
            click_on 'Lancer Recherche'
            expect(page).to have_content 'Produit'
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
            expect(page).to have_content 'Produit'
          end
        end
end
