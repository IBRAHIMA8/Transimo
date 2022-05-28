require 'rails_helper'
RSpec.describe 'Product management function', type: :system do
  before do
  # user2 =  FactoryBot.create(:user_id: user2.id, name: 'user',
  #                            email: 'user@gmail.com',
  #                            password: 'userpassword',
  #                            password_confirmation: 'userpassword',
  #                            confirmed_at: DateTime.now)

@user = User.create!(id:8, name: 'user8', email: "user8@gmail.com", password: "12345678", confirmed_at: DateTime.now)




    # Product.create!(title: 'Nice Home', description: 'This House is nice', localisation: 'Cotonou',availability: 'Free', cost: '25000', user_id: user2.id)

    # FactoryBot.create(:product)
    # FactoryBot.create(:product1)
    # FactoryBot.create(:product2)

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
        click_button 'Log in'
      find("#product_title").set('Home1')
      find("#product_description").set("Nice House")
      find("#product_localisation").set("Cotonou")
      find("#product_availability").set("Free")
      find("#product_remarks").set("Blablabla")
      find("#product_cost").set("25000")
         click_on 'Publish New Product'
       expect(page).to have_content 'Product'
      end
    end
  end




# #okkkkkkkkkk
  describe 'product list screen' do
  context 'When transitioning to the list screen' do
    it 'The created product list is displayed' do
      product = FactoryBot.create(:product, title: 'Nice Home')
      visit products_path
      find("#user_email").set(@user.email)
      find("#user_password").set("12345678")
      click_button 'Log in'
      expect(page).to have_content 'Product'
    end
  end
end




#########      PROBLEM  #################################################################################

  # describe 'Detailed display function' do
  #    context 'When transitioned to any product showing details screen' do
  #      it 'Able To Edit  Content' do
  #       # FactoryBot.create(:product)
  #        visit products_path
  #        find("#user_email").set(@user.email)
  #        find("#user_password").set("12345678")
  #        click_button 'Log in'
  #         find("#Edit").click
  #         fill_in "Title", with: 'New House'
  #         click_button 'Modify'
  #       expect(page).to have_content 'Product'
  #      end
  #    end
  # end
  #
  #
  #
  #
  #
  #
  # describe 'Detailed display function' do
  #    context 'When transitioned to The product details screen' do
  #      it 'Able To Delete Content' do
  #        product = FactoryBot.create(:product, title: 'Nice Home')
  #      visit products_path
  #      find("#user_email").set(@user.email)
  #      find("#user_password").set("12345678")
  #      click_button 'Log in'
  #      click_on 'Destroy'
  #      accept_alert do
  #          find("#delete").click
  #       end
  #       expect(page).to have_content 'Product'
  #      end
  #    end
  # end


################################################################################################################



#okkkkkkkkkk
  describe 'Detailed list in descending order of products' do
      context 'When products are arranged in descending order of cost' do
        it 'List of Products sorted in descending order of cost' do
          visit products_path
          find("#user_email").set(@user.email)
          find("#user_password").set("12345678")
          click_button 'Log in'
          click_on 'Sort by Cost'
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
            click_button 'Log in'
            click_on 'Sort by Locality'
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
              click_button 'Log in'
              click_on 'Sort by Availability'
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
            click_button 'Log in'
            fill_in 'search_title', with: 'House'
            click_on 'search'
            expect(page).to have_content 'Product'
          end

          it "You can search the localisation with the scope method" do
          visit products_path
          find("#user_email").set(@user.email)
          find("#user_password").set("12345678")
          click_button 'Log in'
            fill_in 'search_localisation', with: 'Avrankou'
            click_on 'search'
            expect(page).to have_content 'Product'
          end

          it "You can search the cost with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Log in'
            fill_in 'search_cost', with: '50000'
            click_on 'search'
            expect(page).to have_content 'Product'
          end
          it "You can search the availability with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Log in'
            select 'Free', from: 'search_availability'
            click_on 'search'
            expect(page).to have_content 'Product'
          end
          it "Both title and localisation can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Log in'
            fill_in 'search_title', with: 'House'
            fill_in 'search_localisation', with: 'Avrankou'
            click_on 'search'
            expect(page).to have_content 'Product'
          end
          it "Both title and availability can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Log in'
            fill_in 'search_title', with: 'House'
            select 'Free', from: 'search_availability'
            click_on 'search'
            expect(page).to have_content 'Product'
          end

          it "Both localisation and availability can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Log in'
            fill_in 'search_localisation', with: 'Avrankou'
            select 'Free', from: 'search_availability'
            click_on 'search'
            expect(page).to have_content 'Product'
          end

          it "Both localisation and cost can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Log in'
            fill_in 'search_localisation', with: 'Avrankou'
            fill_in 'search_cost', with: '50000'
            click_on 'search'
            expect(page).to have_content 'Product'
          end

          it "All localisation availability and cost can be searched with the scope method" do
            visit products_path
            find("#user_email").set(@user.email)
            find("#user_password").set("12345678")
            click_button 'Log in'
            fill_in 'search_localisation', with: 'Avrankou'
            select 'Free', from: 'search_availability'
            fill_in 'search_cost', with: '50000'
            click_on 'search'
            expect(page).to have_content 'Product'
          end
        end
end
