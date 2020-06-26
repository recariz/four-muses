require 'faker'
require 'open-uri'

p "Deleting likes"
Like.delete_all
p "Deleting comments"
Comment.delete_all
p "Deleting Contest Applications"
ContestApplication.delete_all
p "Deleting Contest tags"
ContestTag.delete_all
p "Deleting Post tags"
PostTag.delete_all
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


# Be aware that once we execute rails db:seed on production, categories will have an ID that we
# will use any time is needed. If we execute rails db:seed again, this IDs will change,
# (there is a more efficient way to make this dinamic?)
categories = []

photography = Category.create(name: "Photography")
categories << photography

painting = Category.create(name: "Painting")
categories << painting

sculpture = Category.create(name: "Sculpture")
categories << sculpture

architecture = Category.create(name: "Architecture")
categories << architecture

p "Creating Artists..."

users = []
cities = ["Berlin" ,"Amsterdam", "Paris", "Madrid"]

ella = User.new(
    first_name: "Ella",
    last_name: "Fitzgerald",
    nickname: "ella_fitz",
    email: "ella@mail.com",
    password: "123456",
    location:  "Paris",
    type: 'Artist',
    premium: true
)
  painting_interest_ella = Interest.new
  painting_interest_ella.user = ella
  painting_interest_ella.category = painting
  painting_interest_ella.save


  ella.avatar.attach(io: URI.open('https://res.cloudinary.com/dfyhqslry/image/upload/v1592917211/caro_pakuiz.png'), filename: 'caro_pakuiz.png', content_type: 'png')
  ella.save
  p ella
  users << ella

caro = User.new(
    first_name: "Caroline",
    last_name: "Bixner",
    nickname: "carob",
    email: "caroline@mail.com",
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
    first_name: "Patricia",
    last_name: "Recarte",
    nickname: "recariz",
    email: "patricia@mail.com",
    password: "123456",
    location:  cities.sample(1)[0],
    type: 'Artist',
    premium: true
)
  photography_interest_pato = Interest.new
  photography_interest_pato.user = pato
  photography_interest_pato.category = photography
  photography_interest_pato.save

  pato.avatar.attach(io: URI.open('https://res.cloudinary.com/dfyhqslry/image/upload/v1592917211/pato_b0dqeh.png'), filename: 'pato_b0dqeh.png', content_type: 'png')
  pato.save
  p pato
  users << pato

ale = User.new(
    first_name: "Alejandro",
    last_name: "Udaquiola",
    nickname: "aleart",
    email: "alejandro@mail.com",
    password: "123456",
    location:  cities.sample(1)[0],
    type: 'Artist',
    premium: false
)

sculpture_interest_ale = Interest.new
sculpture_interest_ale.user = ale
sculpture_interest_ale.category_id = sculpture.id
sculpture_interest_ale.save

architecture_interest_ale = Interest.new
architecture_interest_ale.user = ale
architecture_interest_ale.category_id = architecture.id
architecture_interest_ale.save


ale.avatar.attach(io: URI.open('https://res.cloudinary.com/dfyhqslry/image/upload/v1592917210/ale_f9seor.jpg'), filename: 'ale_f9seor.jpg', content_type: 'jpg')
  ale.save
  p ale
  users << ale


marta = User.new(
    first_name: "Marta",
    last_name: "Fuste",
    nickname: "martaf",
    email: "marta@mail.com",
    password: "123456",
    location:  cities.sample(1)[0],
    type: 'Artist',
    premium: false
)

architecture_interest_marta = Interest.new
architecture_interest_marta.user = marta
architecture_interest_marta.category_id = architecture.id
architecture_interest_marta.save

marta.avatar.attach(io: URI.open('https://res.cloudinary.com/dfyhqslry/image/upload/v1592917211/marta_lvnhdm.png'), filename: 'marta_lvnhdm.png', content_type: 'png')
  marta.save
  p marta
  users << marta



p "Artists created"

p "Creating Galleries"

miro = User.new(
    nickname: "fmirobcn",
    email: "marta@mail.com",
    password: "123456",
    biography: "A place where to live the art of Joan Miro and other artists from XX and XXI centuries. A space for participation, dialogue and creativity."
    business_name: "Fundacion Joan Miro",
    location:  "Barcelona",
    type: 'Business',
    premium: true
)

miro.avatar.attach(io: URI.open('https://res.cloudinary.com/dfyhqslry/image/upload/v1592917211/marta_lvnhdm.png'), filename: 'marta_lvnhdm.png', content_type: 'png')
miro.save
p miro


picassobcn = User.new(
    nickname: "picassobcn",
    email: "picassobcn@mail.com",
    password: "123456",
    biography: "The Picasso museum in Barcelona, ​​officially and in Catalan Museu Picasso, has a collection of 4,249 works by the Malaga painter Pablo Picasso in the multiple media that it addressed, which is the most complete in the world in works from his youth."
    business_name: "Museu Picasso Barcelona",
    location:  "barcelona",
    type: 'Business',
    premium: true
)

picassobcn.avatar.attach(io: URI.open('https://res.cloudinary.com/dfyhqslry/image/upload/v1592917211/marta_lvnhdm.png'), filename: 'marta_lvnhdm.png', content_type: 'png')
picassobcn.save
p picassobcn

momany = User.new(
    nickname: "moma_ny",
    email: "moma@mail.com",
    password: "123456",
    biography: "The Picasso museum in Barcelona, ​​officially and in Catalan Museu Picasso, has a collection of 4,249 works by the Malaga painter Pablo Picasso in the multiple media that it addressed, which is the most complete in the world in works from his youth."
    business_name: "Museum Of Modern Arts (MOMA)",
    location:  "New York",
    type: 'Business',
    premium: true
)

momany.avatar.attach(io: URI.open('https://res.cloudinary.com/dfyhqslry/image/upload/v1592917211/marta_lvnhdm.png'), filename: 'marta_lvnhdm.png', content_type: 'png')
momany.save
p momany
# users.each do |user|
#    p "Creating posts for #{user.nickname}..."
#    2.times do
#         post = Post.new(
#             title: Faker::Artist.name,
#             description: Faker::ChuckNorris.fact
#         )
#         post.user_id = user.id
#         post.photos.attach(io: URI.open("https://res.cloudinary.com/dfyhqslry/image/upload/v1592917862/Post%20pics/caro/nenad-radojcic-RF5U8BkaQHU-unsplash_cvkkuk.jpg"), filename: 'nenad-radojcic-RF5U8BkaQHU-unsplash_cvkkuk.jpg', content_type: 'jpg')
#         post.save
#     end
# end

p "Posts created"

p "Creating Contests"

contest_p = Contest.new(
  start_date: ("2020/10/11"),
  end_date: ("2020/10/16"),
  city: "Barcelona",
  location: "Carrer d'en Grassot, 101",
  title: Faker::Artist.name,
  content: Faker::ChuckNorris.fact
)
contest_p.user_id = picassobcn.id
contest_p.photo.attach(io: URI.open("https://res.cloudinary.com/dfyhqslry/image/upload/v1592917862/Post%20pics/caro/nenad-radojcic-RF5U8BkaQHU-unsplash_cvkkuk.jpg"), filename: 'nenad-radojcic-RF5U8BkaQHU-unsplash_cvkkuk.jpg', content_type: 'jpg')
contest_p.save
p contest_p

contest_m = Contest.new(
  start_date: ("2020/10/11"),
  end_date: ("2020/10/16"),
  city: "Barcelona",
  location: "Carrer d'en Grassot, 101",
  title: Faker::Artist.name,
  content: Faker::ChuckNorris.fact
)
contest_m.user_id = miro.id
contest_m.photo.attach(io: URI.open("https://res.cloudinary.com/dfyhqslry/image/upload/v1592917862/Post%20pics/caro/nenad-radojcic-RF5U8BkaQHU-unsplash_cvkkuk.jpg"), filename: 'nenad-radojcic-RF5U8BkaQHU-unsplash_cvkkuk.jpg', content_type: 'jpg')
contest_m.save
p contest_m

p "Contests created"


# /!\ Be aware that once we execute rails db:seed on production, tags will have an ID that we
# will use any time is needed. If we execute rails db:seed again, this IDs will change,

p "Creating Contest tags"

# /!\ Contest tag is needing to be on a contest in order to exist

architecture_tag = ContestTag.new
architecture_tag.category_id = architecture.id
architecture_tag.contest_id = contest_m.id
architecture_tag.save
p architecture_tag

painting_tag = ContestTag.new
painting_tag.category_id = painting.id
painting_tag.contest_id = contest_m.id
painting_tag.save
p painting_tag

photography_tag = ContestTag.new
photography_tag.category_id = photography.id
photography_tag.contest_id = contest_p.id
photography_tag.save
p photography_tag

sculpture_tag = ContestTag.new
sculpture_tag.category_id = sculpture.id
sculpture_tag.contest_id = contest_p.id
sculpture_tag.save
p sculpture_tag

p "Contest tag created"

p "Creating post tags"

post = Post.first

architecture_post_tag = PostTag.new
architecture_post_tag.category_id = architecture.id
architecture_post_tag.post_id = post.id
architecture_post_tag.save
p architecture_post_tag

painting_post_tag = PostTag.new
painting_post_tag.category_id = painting.id
painting_post_tag.post_id = post.id
painting_post_tag.save
p painting_post_tag

painting_post_tag = PostTag.new
painting_post_tag.category_id = photography.id
painting_post_tag.post_id = post.id
painting_post_tag.save
p painting_post_tag

sculpture_post_tag = PostTag.new
sculpture_post_tag.category_id = sculpture.id
sculpture_post_tag.post_id = post.id
sculpture_post_tag.save
p sculpture_post_tag

p "Post tags created"

p "Seeds completed!"
