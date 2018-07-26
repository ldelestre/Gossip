require 'faker'

nb_user = 10
nb_villes = 6
nb_de_gossip = 20
nb_tag = 20
nb_comment = 12

nb_user.times do
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Movie.quote, email: Faker::Internet.email, age: Faker::Number.number(2))
end
puts "-- Création de #{nb_user} users --"

#
nb_villes.times do
	Ville.create(name: Faker::Name.first_name, postal_code: Faker::Address.zip_code)
end
puts "-- Création de #{nb_villes} villes & liens avec les users --"

nb_de_gossip.times do
	Gossip.create(title: Faker::Pokemon.name, content: Faker::Movie.quote, date: Faker::Time.between(DateTime.now - 1, DateTime.now), user_id: rand(User.first.id..User.last.id))
end
puts "-- Création des gossips --"


nb_de_gossip.times do |i|
	Tag.create(gossip_id: (i+1), title: Faker::Pokemon.name)
end
puts"-- Création de #{nb_de_gossip} tags --"


id_recipient = rand(User.first.id..User.last.id)
begin
	id_sender = rand(User.first.id..User.last.id)
end while(id_sender==id_recipient)
PrivateMessage.create(content: Faker::Movie.quote, date: Faker::Time.between(DateTime.now - 1, DateTime.now), recipient_id: id_recipient, sender_id: id_sender)
puts "-- Création MP --"


nb_comment.times do
	Comment.create!(user_id: rand(User.first.id..User.last.id), gossip_id: rand(Gossip.first.id..Gossip.last.id), content: Faker::Movie.quote)
end
puts "-- Création de #{nb_comment} commentaires --"


20.times do
 Like.create(
 like: Faker::Boolean.boolean
)
end
puts "-- Création de 20 likes --"