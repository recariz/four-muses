require 'faker'
require 'open-uri'


# p "Deleting likes"
#  Vote.delete_all

p "Deleting messages"
Message.delete_all
p "Deleting chatrooms"
Chatroom.delete_all
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
  painting_interest_ella.category_id = painting.id
  painting_interest_ella.save


  ella.avatar.attach(io: File.open('app/assets/images/artist.jpg'), filename: 'ella.jpg', content_type: 'jpg')
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
  photography_interest_caro.category_id = photography.id
  photography_interest_caro.save

  painting_interest_caro = Interest.new
  painting_interest_caro.user = caro
  painting_interest_caro.category_id = painting.id
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
  photography_interest_pato.category_id = photography.id
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
    email: "miro@mail.com",
    password: "123456",
    biography: "A place where to live the art of Joan Miro and other artists from XX and XXI centuries. A space for participation, dialogue and creativity.",
    business_name: "Fundacion Joan Miro",
    location:  "Barcelona",
    type: 'Business',
    premium: true
)

miro.avatar.attach(io: File.open('app/assets/images/fundacion-joan-miro.jpg'), filename: 'miro_museum.jpg', content_type: 'jpg')
miro.save
p miro


picassobcn = User.new(
    nickname: "picassobcn",
    email: "picassobcn@mail.com",
    password: "123456",
    biography: "The Picasso museum in Barcelona, ​​officially and in Catalan Museu Picasso, has a collection of 4,249 works by the Malaga painter Pablo Picasso in the multiple media that it addressed, which is the most complete in the world in works from his youth.",
    business_name: "Museu Picasso Barcelona",
    location:  "Barcelona",
    type: 'Business',
    premium: true
)

picassobcn.avatar.attach(io: File.open('app/assets/images/picasso-bcn.jpg'), filename: 'picasso_museum.jpg', content_type: 'jpg')
picassobcn.save
p picassobcn

momany = User.new(
    nickname: "moma_ny",
    email: "moma@mail.com",
    password: "123456",
    biography: "At the MOMA, we’re committed to sharing the most thought-provoking modern and contemporary art, and hope you will join us in exploring the art, ideas, and issues of our time.",
    business_name: "Museum Of Modern Arts (MOMA)",
    location:  "New York",
    type: 'Business',
    premium: true
)

momany.avatar.attach(io: File.open('app/assets/images/moma_ny.jpg'), filename: 'moma_ny.jpg', content_type: 'jpg')
momany.save
p momany

orsay = User.new(
    nickname: "orsay",
    email: "orsay@mail.com",
    password: "123456",
    biography: "Art gallery located in Paris, which is dedicated to the plastic arts of the 19th century and, more specifically, of the period 1848-1914",
    business_name: "Orsay Museum",
    location:  "Paris",
    type: 'Business',
    premium: true
)

orsay.avatar.attach(io: File.open('app/assets/images/orsay-museum.jpg'), filename: 'orsay.jpg', content_type: 'jpg')
orsay.save
p orsay

p "Galleries created!"

p "Creating posts"

post_ella = Post.new(
    title: "Magic Forest",
    description: "Oil on canvas inspired on my childhood times"
)
post_ella.user_id = ella.id
post_ella.photos.attach(io: File.open('app/assets/images/ella_painting.jpg'), filename: 'ella_paint.jpg', content_type: 'jpg')
post_ella.save

post_orsay = Post.new(
    title: "Back to normality",
    description: "Orsay museum is happy to announce the reopening of its doors from next Monday"
)
post_orsay.user_id = orsay.id
post_orsay.photos.attach(io: File.open('app/assets/images/orsay_open.jpg'), filename: 'orsay_open.jpg', content_type: 'jpg')
post_orsay.save

post_caro = Post.new(
    title: "Maze",
    description: "Use of colors to represent the different emotions "
)
post_caro.user_id = caro.id
post_caro.photos.attach(io: File.open('app/assets/images/painting_caro.jpg'), filename: 'caropaint.jpg', content_type: 'jpg')
post_caro.save

p "Posts created"

p "Creating Contests"

contest_color = Contest.new(
  start_date: ("2020/08/11"),
  end_date: ("2020/08/16"),
  city: "Barcelona",
  location: "Carrer d'en Grassot, 101",
  title: "Color Sense",
  content: "Artists are asked to submit works that address the studied use of color, where color is a big part of the artist’s toolset and is what makes the work complete.  Accepting all original visual media excluding video and other time-based media such as animated Gifs. All styles and subject matter accepted."

)
contest_color.user_id = picassobcn.id
contest_color.photo.attach(io: File.open('app/assets/images/color_sense.jpg'), filename: 'orsay.jpg', content_type: 'jpg')
contest_color.save
p contest_color

contest_bust = Contest.new(
  start_date: ("2020/10/10"),
  end_date: ("2020/10/16"),
  city: "Barcelona",
  location: "Carrer d'en Grassot, 101",
  title: "Emotions on inert objects",
  content: "Entries should address the representation of emotions on solid and inert objects. All materials permitted, from stone and cast to plastics and metals. We look forward to receiving your emotive art pieces."
)
contest_bust.user_id = miro.id
contest_bust.photo.attach(io: File.open('app/assets/images/sulpture_contest.jpg'), filename: 'orsay.jpg', content_type: 'jpg')
contest_bust.save
p contest_bust

p "Contests created"


# /!\ Be aware that once we execute rails db:seed on production, tags will have an ID that we
# will use any time is needed. If we execute rails db:seed again, this IDs will change,

p "Creating Contest tags"

# /!\ Contest tag is needing to be on a contest in order to exist

architecture_tag_color = ContestTag.new
architecture_tag_color.category_id = architecture.id
architecture_tag_color.contest_id = contest_color.id
architecture_tag_color.save
p architecture_tag_color

painting_tag_color = ContestTag.new
painting_tag_color.category_id = painting.id
painting_tag_color.contest_id = contest_color.id
painting_tag_color.save
p painting_tag_color

photography_tag_color = ContestTag.new
photography_tag_color.category_id = photography.id
photography_tag_color.contest_id = contest_color.id
photography_tag_color.save
p photography_tag_color

sculpture_tag_color = ContestTag.new
sculpture_tag_color.category_id = sculpture.id
sculpture_tag_color.contest_id = contest_color.id
sculpture_tag_color.save
p sculpture_tag_color

sculpture_tag_bust = ContestTag.new
sculpture_tag_bust.category_id = sculpture.id
sculpture_tag_bust.contest_id = contest_bust.id
sculpture_tag_bust.save
p sculpture_tag_bust

p "Contest tag created"

# p "Creating post tags"

# post = Post.first

# architecture_post_tag = PostTag.new
# architecture_post_tag.category_id = architecture.id
# architecture_post_tag.post_id = post.id
# architecture_post_tag.save
# p architecture_post_tag

# painting_post_tag = PostTag.new
# painting_post_tag.category_id = painting.id
# painting_post_tag.post_id = post.id
# painting_post_tag.save
# p painting_post_tag

# painting_post_tag = PostTag.new
# painting_post_tag.category_id = photography.id
# painting_post_tag.post_id = post.id
# painting_post_tag.save
# p painting_post_tag

# sculpture_post_tag = PostTag.new
# sculpture_post_tag.category_id = sculpture.id
# sculpture_post_tag.post_id = post.id
# sculpture_post_tag.save
# p sculpture_post_tag

# p "Post tags created"

p "Seeds completed!"
