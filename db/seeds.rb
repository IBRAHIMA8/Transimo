# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
user = User.create(
        name: "admin",
        email: "transimodimin@gmail.com",
        password: "admin123456",
        password_confirmation: "admin123456",
        admin: true
      )

user = User.create(
        name: "guest_a",
        email: "transimoinvit@gmail.com",
        password: "invit123456",
        password_confirmation: "invit123456")



user1 = User.create!(
  name: "Adoukè1",
  email: "adouke1@example.com",
  password:"123456",
  admin: false,
)

user2 = User.create!(
  name: "Adoukè2",
  email: "adouke2@example.com",
  password:"123456",
  admin: false,
)

user3 = User.create!(
  name: "Adoukè3",
  email: "adouke3@example.com",
  password:"123456",
  admin: false,
)

user4 = User.create!(
  name: "Adoukè4",
  email: "adouke4@example.com",
  password:"123456",
  admin: false,
)

user5 = User.create!(
  name: "Adoukè5",
  email: "adouke5@example.com",
  password:"123456",
  admin: false,
)

conversation1 = Conversation.create!(
 sender_id: user2.id,
 recipient_id: user5.id
)

conversation2 = Conversation.create!(
 sender_id:  user1.id,
 recipient_id: user4.id
)
conversation3 = Conversation.create!(
 sender_id:  user1.id,
 recipient_id: user3.id
)

conversation4 = Conversation.create!(
 sender_id:  user4.id,
 recipient_id: user5.id
)
conversation5 = Conversation.create!(
 sender_id:  user4.id,
 recipient_id: user3.id
)

Message.create!(
  conversation_id: conversation1.id,
  user_id: user2.id,
  body:"Salut, comment allez vous ? Je suis interressé par un de vos produits.",
  read: true
)
Message.create!(
  conversation_id: conversation1.id,
  user_id: user5.id,
  body:"Bonjour, Ok. Dites moi, êtes-vous prêts pour un rendez-vous pour les formalités?",
  read: false
)
Message.create!(
  conversation_id: conversation2.id,
  user_id: user4.id,
  body:"Bonjour, j'aimerais savoir si votre maison de tankpê est toujours disponible",
  read: true
)
Message.create!(
  conversation_id: conversation2.id,
  user_id: user3.id,
  body:"Salut, j'espère que vous allez bien. Non, cette est déjà libérée depuis 3 jours",
  read: false
)
Message.create!(
  conversation_id: conversation3.id,
  user_id: user4.id,
  body:"Ok, merci.",
  read: true
)


availability = ['Libre', 'Immédiatement_Libre', 'Bientôt_Libre']

image = ["https://previews.123rf.com/images/piovesempre/piovesempre1409/piovesempre140900071/31652517-villa-de-luxe-avec-piscine-%C3%A0-d%C3%A9bordement.jpg",
"https://fotomelia.com/wp-content/uploads/edd/2015/11/banque-d-images-gratuites-libres-de-droits419-1560x1170.jpg",
"https://previews.123rf.com/images/dotshock/dotshock1504/dotshock150400003/38541199-vue-ext%C3%A9rieure-d-une-maison-contemporaine-villa-moderne.jpg",
"https://media.istockphoto.com/photos/modern-minimalist-family-villa-picture-id1180620728?s=612x612",
"https://media.bazarafrique.com/upload/post/6231554ae4ef1308687605.jpg"]

5.times do |i|
    Product.create(
      title: "product#{i + 1}",
      description: "product description#{i + 1}",
      localisation: "product localisation#{i + 1}",
      availability: availability.sample,
      remarks: "remarks#{i + 1}",
      cost: Faker::Number.number(digits: 3) * 100,
      image: image.sample,
      user_id: rand(1..6)
    )
end
