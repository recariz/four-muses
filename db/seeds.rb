require 'faker'
require 'open-uri'

p "Deleting categories"
Category.delete_all
p "Deleting Posts..."
Post.delete_all
p "Deleting Contests..."
Contest.delete_all
p "Deleting Users..."
User.delete_all


p "Creating categories..."

categories = []

photography = Category.new(name: "Photography")
categories << photography

painting = Category.new(name: "Painting")
categories << painting

sculpture = Category.new(name: "Sculpture")
categories << sculpture

architecture = Category.new(name: "Architecture")
categories << architecture

p "Creating users..."

users = []
cities = ["berlin" ,"amsterdam", "paris", "madrid"]

caro = User.new(
    first_name: "Caroline",
    last_name: "Bixner",
    nickname: "Caro",
    email: "carolina@mail.com",
    password: "123456",
    interests: [],
    location:  cities.sample(1)[0],
    type: 'Artist',
    premium: true
)
caro.avatar.attach(io: URI.open('https://res.cloudinary.com/dfyhqslry/image/upload/v1592917211/caro_pakuiz.png'), filename: 'caro_pakuiz.png', content_type: 'png')
  caro.save
  p caro
  users << caro

pato = User.new(
    nickname: "Pato",
    business_name: "Pato holdings SL",
    email: "patricia@mail.com",
    password: "123456",
    location:  cities.sample(1)[0],
    type: 'Business'
)
pato.avatar.attach(io: URI.open('https://res.cloudinary.com/dfyhqslry/image/upload/v1592917211/pato_b0dqeh.png'), filename: 'pato_b0dqeh.png', content_type: 'png')
  pato.save
  p pato
  users << pato

marta = User.new(
    nickname: "Marta",
    business_name: "Marta & company SL",
    email: "marta@mail.com",
    password: "123456",
    location:  cities.sample(1)[0],
    type: 'Business'
)
marta.avatar.attach(io: URI.open('https://res.cloudinary.com/dfyhqslry/image/upload/v1592917211/marta_lvnhdm.png'), filename: 'marta_lvnhdm.png', content_type: 'png')
  marta.save
  p marta
  users << marta

ale = User.new(
    first_name: "Alejandro",
    last_name: "Udaquiola",
    nickname: "Ale",
    email: "alejandro@mail.com",
    password: "123456",
    interests: [],
    location:  cities.sample(1)[0],
    type: 'Artist',
    premium: false
)
ale.avatar.attach(io: URI.open('https://res.cloudinary.com/dfyhqslry/image/upload/v1592917210/ale_f9seor.jpg'), filename: 'ale_f9seor.jpg', content_type: 'jpg')
  ale.save
  p ale
  users << ale

p "Users created"

users.each do |user|
   p "Creating posts for #{user.nickname}..."
   2.times do
        post = Post.new(
            title: Faker::Artist.name,
            description: Faker::ChuckNorris.fact
        )
        post.user_id = user.id
        post.photos.attach(io: URI.open("https://res.cloudinary.com/dfyhqslry/image/upload/v1592917862/Post%20pics/caro/nenad-radojcic-RF5U8BkaQHU-unsplash_cvkkuk.jpg"), filename: 'nenad-radojcic-RF5U8BkaQHU-unsplash_cvkkuk.jpg', content_type: 'jpg')
    end
end

p "Seeds completed!"