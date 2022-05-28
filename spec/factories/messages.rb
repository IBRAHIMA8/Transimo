require 'factory_bot'
FactoryBot.define do
  factory :message do
     body{'test'}
     conversation_id{4}
     user_id{ 3 }
     read{true}
  end
end
