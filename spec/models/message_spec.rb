require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "Message validations" do
it "Validation does not pass if body is 255 characters or more" do
      message = Message.new(body: 'aaaaaaaaaabbbbbbbbbbbbboojojco12345678910123456789aaaaaaaaaabbbbbbbbbbbbboojojco12345678910123456789aaaaaaaaaabbbbbbbbbbbbboojojco12345678910123456789aaaaaaaaaabbbbbbbbbbbbboojojco12345678910123456789aaaaaaaaaabbbbbbbbbbbbboojojco12345678910123456789aaaaaaaaaabbbbbbbbbbbbboojojco12345678910123456789aaaaaaaaaabbbbbbbbbbbbboojojco12345678910123456789aaaaaaaaaabbbbbbbbbbbbboojojco12345678910123456789aaaaaaaaaabbbbbbbbbbbbboojojco12345678910123456789')
   expect(message).not_to be_valid
 end
end
describe "Message validations" do
it "Validation does not pass if body is empty" do
      message = Message.new(body: '')
   expect(message).not_to be_valid
 end
end
describe "Message validations" do
 it "Validation does not pass if conversation_id is empty" do
       message = Message.new(conversation_id: '')
    expect(message).not_to be_valid
  end
 end
 it "Validation does not pass if user_id is empty" do
       message = Message.new(user_id: '')
    expect(message).not_to be_valid
  end
end
describe "Message validations" do
  it "Validation does pass if conversation_id and body are not empty " do
    @user1 = User.create!(email: "hello123@user.com", password: "password", confirmed_at: DateTime.now)
    @user2 = User.create!(email: "hello1234@user.com", password: "password", confirmed_at: DateTime.now)
   @conversation = Conversation.create(sender_id:@user1.id, recipient_id:@user2.id)
       message = Message.new(user_id: @user1.id, conversation_id: @conversation.id, body:'Test')
    expect(message).to be_valid
  end
end
