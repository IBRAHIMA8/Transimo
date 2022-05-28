require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User Registration" do
    context "Registration without one attributes " do
      it "Does not pass without email" do
        user = User.new(name: 'naemailuser1', email: nil, password: "password")
        expect(user).not_to be_valid
      end
      it "Does not pass without password" do
        user = User.new(name: 'user1', email: "nopwexample@.com", password: nil)
        expect(user).not_to be_valid
      end
      it "Does not pass without name" do
        user = User.new(name: nil, email: "nonameexample.com", password: 'password')
        expect(user).not_to be_valid
      end
      it "Does not pass with false email" do
        user = User.new(name: 'user1', email: "falsemailexample.co", password: 'password')
        expect(user).not_to be_valid
      end

    end
    context "Ragistrations pass" do
      it "register user with all neccessaries informations" do
        user = User.new(name: 'user1', email: "allnessinf@example.com", password: "password")
        expect(user).to be_valid
      end
    end
  end
end
