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
    @product = Product.create!(title: 'Nice Home', description: 'This House is nice', localisation: 'Cotonou',availability: 'Free', cost: '25000', user_id: @user.id)
    product = Product.new(user_id: @user.id, title: 'My House')
    expect(product).to be_valid
  end
end
