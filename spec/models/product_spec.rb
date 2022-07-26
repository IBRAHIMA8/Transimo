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
        @user = User.create!(name: 'user1', email: "userexample@.com", password: "password", confirmed_at: DateTime.now)
        @product = Product.create!(title: 'Nice Home', description: 'This House is nice', localisation: 'Cotonou',availability: 'Libre', cost: '25000')
        @second_product = Product.create!(title: 'Nice Home', description: 'This House is nice', localisation: 'Cotonou',availability: 'Libre', cost: '25000')
        @third_product = Product.create!(title: 'Nice Home', description: 'This House is nice', localisation: 'Cotonou',availability: 'Libre', cost: '25000')
      end
      it 'You can search for titles' do
        expect(Product.search_sort('product')).to include(@product)
      end
      it 'You can search the status' do
        expect(Product.status_sort(1)).to include(@second_product)
      end
      it 'You can search the priority' do
        expect(Product.priority_sort(1)).to include(@third_product)
      end
      it 'You can search for both title and status' do
        expect(Product.search_sort('third_product').status_sort(2)).to include(@third_product)
      end
    end
end
