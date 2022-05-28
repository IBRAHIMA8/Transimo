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
        email: "hadi.ibrahima@gmail.com",
        password: "123456",
        password_confirmation: "123456",
        admin: true
      )

user = User.create(
        name: "guest_a",
        email: "transimoguest@gmail.com",
        password: "guests123456",
        password_confirmation: "guests123456")



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
  email: "adouke4@example.com",
  password:"123456",
  admin: false,
)
user5 = User.create!(
  name: "Adoukè3",
  email: "adouke5@example.com",
  password:"123456",
  admin: true,
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


availability = ['Free', 'Immediatly', 'Notfree']

image = ['https://www.google.com/url?sa=i&url=https%3A%2F%2Fplayplay.com%2Fblog%2Ffr%2Fvideo-immobilier%2F&psig=AOvVaw0HTUB5Djjfdqt2Pk-BG14B&ust=1653661474058000&source=images&cd=vfe&ved=0CAkQjRxqFwoTCKjP56Cv_fcCFQAAAAAdAAAAABAD', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.plan-immobilier.fr%2Fguide-immobilier%2Fhabiter%2Fguide-achat%2Fdifferents-types-biens-immobilier&psig=AOvVaw0HTUB5Djjfdqt2Pk-BG14B&ust=1653661474058000&source=images&cd=vfe&ved=0CAkQjRxqFwoTCKjP56Cv_fcCFQAAAAAdAAAAABAJ', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.kanataimmobilier.net%2Fwp-content%2Fuploads%2F2021%2F02%2Fsmall_pic3.jpg&imgrefurl=https%3A%2F%2Fwww.kanataimmobilier.net%2F&tbnid=rEPmZOvqEayxYM&vet=12ahUKEwi5oZiXr_33AhWkgv0HHRoYDscQMyhiegUIARDDAQ..i&docid=74EJkI3nNpNcZM&w=400&h=266&q=image%20immobilier&ved=2ahUKEwi5oZiXr_33AhWkgv0HHRoYDscQMyhiegUIARDDAQ', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.nord-sud-immobilier.com%2Fimages%2Fheader-img.png&imgrefurl=https%3A%2F%2Fwww.nord-sud-immobilier.com%2F&tbnid=Vf9U95uPtWwu6M&vet=10CBgQMyhyahcKEwioz-egr_33AhUAAAAAHQAAAAAQDg..i&docid=51MOxio286kxCM&w=2560&h=993&q=image%20immobilier&ved=0CBgQMyhyahcKEwioz-egr_33AhUAAAAAHQAAAAAQDg']

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
