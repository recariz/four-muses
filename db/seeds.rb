require 'faker'
require 'open-uri'

p "Deleting interests"
Interest.delete_all
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

photography = Category.create(name: "Photography")
categories << photography

painting = Category.create(name: "Painting")
categories << painting

sculpture = Category.create(name: "Sculpture")
categories << sculpture

architecture = Category.create(name: "Architecture")
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
    location:  cities.sample(1)[0],
    type: 'Artist',
    premium: true
)
  photography_interest_caro = Interest.new
  photography_interest_caro.user = caro
  photography_interest_caro.category = photography
  photography_interest_caro.save

  painting_interest_caro = Interest.new
  painting_interest_caro.user = caro
  painting_interest_caro.category = painting
  painting_interest_caro.save


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
    location:  cities.sample(1)[0],
    type: 'Artist',
    premium: false
)

sculpture_interest_ale = Interest.new
sculpture_interest_ale.user = pato
sculpture_interest_ale.category = sculpture
sculpture_interest_ale.save

architecture_interest_ale = Interest.new
architecture_interest_ale.user = pato
architecture_interest_ale.category = architecture
architecture_interest_ale.save

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

p "Creating Contests"

contest_p = Contest.new(
  start_date: ("10/10/20"),
  end_date: ("10/10/20"),
  location: "Carrer d'en Grassot, 101, 08025 Barcelona, España",
  title: Faker::Artist.name,
  content: Faker::ChuckNorris.fact
)
contest_p.user_id = pato.id
contest_p.photo.attach(io: URI.open("https://res.cloudinary.com/dfyhqslry/image/upload/v1592917862/Post%20pics/caro/nenad-radojcic-RF5U8BkaQHU-unsplash_cvkkuk.jpg"), filename: 'nenad-radojcic-RF5U8BkaQHU-unsplash_cvkkuk.jpg', content_type: 'jpg')
contest_p.save
p contest_p

contest_m = Contest.new(
  start_date: ("10/10/20"),
  end_date: ("10/10/20"),
  location: "Carrer d'en Grassot, 101, 08025 Barcelona, España",
  title: Faker::Artist.name,
  content: Faker::ChuckNorris.fact
)
contest_m.user_id = marta.id
contest_m.photo.attach(io: URI.open("https://res.cloudinary.com/dfyhqslry/image/upload/v1592917862/Post%20pics/caro/nenad-radojcic-RF5U8BkaQHU-unsplash_cvkkuk.jpg"), filename: 'nenad-radojcic-RF5U8BkaQHU-unsplash_cvkkuk.jpg', content_type: 'jpg')
contest_m.save
p contest_m

p "Contests created"

p "Seeds completed!"
