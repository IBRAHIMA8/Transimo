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


availability = ['Libre', 'Immédiatement_Libre', 'Bientôt_Libre']

image = ['https://www.google.com/imgres?imgurl=https%3A%2F%2Fhgtvhome.sndimg.com%2Fcontent%2Fdam%2Fimages%2Fhgtv%2Ffullset%2F2019%2F9%2F16%2F0%2FIO_Tongue-and-Groove_Beech-Street_3.jpg.rend.hgtvcom.616.411.suffix%2F1568648112267.jpeg&imgrefurl=https%3A%2F%2Fwww.hgtv.com%2Fdesign%2Fremodel%2Finterior-remodel%2F30-tips-for-increasing-your-homes-value&tbnid=jXohUSryMxS0zM&vet=12ahUKEwiz1v2sz4_4AhUPfBoKHfjFA5IQMygCegUIARDdAQ..i&docid=1oNiDd08yumiWM&w=616&h=411&q=home%20omage&ved=2ahUKEwiz1v2sz4_4AhUPfBoKHfjFA5IQMygCegUIARDdAQ','https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.istockphoto.com%2Fphotos%2Fmodern-custom-suburban-home-exterior-picture-id1255835529%3Fk%3D20%26m%3D1255835529%26s%3D170667a%26w%3D0%26h%3DkOKK0c7TSjopShSdYA8wJPro8iJm2cyrKA_wI5EcXJ0%3D&imgrefurl=https%3A%2F%2Fwww.istockphoto.com%2Ffr%2Fphoto%2Fmodern-custom-suburban-home-ext%25C3%25A9rieur-gm1255835529-367504962&tbnid=cZClq3qsPMCTVM&vet=12ahUKEwiz1v2sz4_4AhUPfBoKHfjFA5IQMygKegUIARDwAQ..i&docid=svAali7epMUjfM&w=480&h=360&q=home%20omage&ved=2ahUKEwiz1v2sz4_4AhUPfBoKHfjFA5IQMygKegUIARDwAQ','https://www.google.com/imgres?imgurl=https%3A%2F%2Fmccoymart.com%2Fpost%2Fwp-content%2Fuploads%2F2020%2F03%2FHome-Design-and-Plans-According-to-Vastu-Shastra-370x200.jpg&imgrefurl=https%3A%2F%2Fmccoymart.com%2Fpost%2Fvastu-shastra-home-design-plans%2F&tbnid=dnKH609zTrnxUM&vet=12ahUKEwiz1v2sz4_4AhUPfBoKHfjFA5IQMygNegUIARD3AQ..i&docid=UhGifHIpiaYK4M&w=370&h=200&q=home%20omage&ved=2ahUKEwiz1v2sz4_4AhUPfBoKHfjFA5IQMygNegUIARD3AQ','https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.gettyimages.com%2Fphotos%2Fmodern-home-with-swimming-pool-picture-id147205632%3Fs%3D612x612&imgrefurl=https%3A%2F%2Fwww.gettyimages.fr%2Fphotos%2Fhouse&tbnid=_PcBpKwzkTbBVM&vet=12ahUKEwiz1v2sz4_4AhUPfBoKHfjFA5IQMygTegUIARCDAg..i&docid=pnwR5PZ-sdvxPM&w=612&h=408&q=home%20omage&ved=2ahUKEwiz1v2sz4_4AhUPfBoKHfjFA5IQMygTegUIARCDAg','https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.distinctivehomes.com.au%2Fwp-content%2Fuploads%2F2018%2F04%2FDistinctiveHomesBackground-1.png&imgrefurl=https%3A%2F%2Fdistinctivehomes.com.au%2F&tbnid=XRUpHn6JrrelNM&vet=12ahUKEwiz1v2sz4_4AhUPfBoKHfjFA5IQMygvegUIARDEAg..i&docid=dzO5wBJgYY-8HM&w=1191&h=650&q=home%20omage&ved=2ahUKEwiz1v2sz4_4AhUPfBoKHfjFA5IQMygvegUIARDEAg']

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
