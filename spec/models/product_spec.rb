require 'rails_helper'

RSpec.describe Product, type: :model do

  it 'validation does not pass if the Product title is empty' do
    product = Product.new(user_id: 2 , title: nil)
    expect(product).not_to be_valid
  end

  it 'validation does not pass if the user_id is nil' do
    product = Product.new(user_id: nil , title: 'Home on beach')
    expect(product).not_to be_valid
  end

  it 'Validations pass if all attributes are present' do
    @user = User.create!(name: 'user1', email: "userexample@.com", password: "password", confirmed_at: DateTime.now)
    @product = Product.create!(title: 'Nice Home', description: 'This House is nice', localisation: 'Cotonou',availability: 'Libre', cost: '25000', user_id: @user.id)
    product = Product.new(user_id: @user.id, title: 'My House', description: 'This House is nice', localisation: 'Cotonou',availability: 'Libre', cost: '25000')
    expect(product).to be_valid
  end

  describe 'You can search with the scope method' do
      before do
        @product = FactoryBot.create(:product, title: 'Nice Home', description: 'This House is nice', localisation: 'Cotonou',availability: 'Libre', cost: '25000')
        @product1 = FactoryBot.create(:product1, title: 'Nice Home1', description: 'This House is very nice', localisation: 'Cotonou1',availability: 'Libre', cost: '75000')
        @product2 = FactoryBot.create(:product2, title: 'Nice One Home', description: 'This House is also nice', localisation: 'Cotonou3',availability: 'Libre', cost: '125000')
      end
      it 'You can search for titles' do
        expect(Product.search_sort('Nice Home')).to include(@product)
      end


      it 'You can search the localisations' do
        expect(Product.localisation_sort('Cotonou3')).to include(@product2)
      end

      it 'You can search for availabilities' do
        expect(Product.availability_sort('Libre')).to include(@product)
      end

      it 'You can search the costs' do
        expect(Product.cost_sort('75000')).to include(@product1)
      end

      it 'You can search for both title and availabilities' do
        expect(Product.search_sort('Nice One Home').availability_sort('Libre')).to include(@product2)
      end

      it 'You can search for both title and localisations' do
        expect(Product.search_sort('Nice One Home').localisation_sort('Cotonou3')).to include(@product2)
      end

        it 'You can search for both title and costs' do
          expect(Product.search_sort('Nice Home').cost_sort('25000')).to include(@product)
      end
      it 'You can search for both availabilities and localisations' do
        expect(Product.availability_sort('Libre').localisation_sort('Cotonou1')).to include(@product1)
      end
      it 'You can search for both availabilities and costs' do
        expect(Product.availability_sort('Libre').cost_sort('75000')).to include(@product1)
      end
      it 'You can search for both localisations and costs' do
        expect(Product.localisation_sort('Cotonou1').cost_sort('75000')).to include(@product1)
      end
      it 'You can search for all title, localisation availability and cost ' do
        expect(Product.search_sort('Nice Home').localisation_sort('Cotonou').availability_sort('Libre').cost_sort('25000')).to include(@product)
    end
    end
end
