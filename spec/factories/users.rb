#require 'factory_bot'
FactoryBot.define do
  factory :user do
    id { 9 }
   name { 'user' }
   email { 'user9@gmail.com' }
   password { '12345678' }
   admin { false }
 end
 factory :user1 do
   id { 3 }
  name { 'hadi' }
  email { 'hadi@gmail.com' }
  password { '00000000' }
  admin { false }
end
 factory :admin_user, class: User do
   id { 1 }
   name { 'admin' }
   email { 'admin@gmail.com' }
   password { '99999999' }
   admin { true }

  end
end
