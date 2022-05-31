require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe "Conversations validations" do
it "Validation does not pass if sender_id and recipient_id are the same." do
   conversation = Conversation.create(sender_id: 1, recipient_id: 2)
   expect(conversation).not_to be_valid
 end
end
describe "Conversations validations" do
it "Validation does pass if sender_id and recipient_id are not the same." do
  @user1 = User.create!(name: 'user1', email: "user1example@.com", password: "password", confirmed_at: DateTime.now)
  puts @user1
  @user2 = User.create!(name: 'user2', email: "user2example@.com", password: "password", confirmed_at: DateTime.now)
  puts @user2
 conversation = Conversation.create(sender_id: @user1.id, recipient_id: @user2.id)
 expect(conversation).to be_valid
end
end
end
