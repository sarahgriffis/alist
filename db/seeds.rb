# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Celebrity.create(
  first_name: 'Jennifer',
  last_name: 'Garner',
  photo_url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Jennifer_Garner_cropped.jpg/440px-Jennifer_Garner_cropped.jpg'
)

Celebrity.create(
  first_name: 'Kevin',
  last_name: 'Bacon',
  photo_url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Kevin_Bacon_SDCC_2014.jpg/440px-Kevin_Bacon_SDCC_2014.jpg'
)

Celebrity.create(
  first_name: 'Beck',
  last_name: '',
  photo_url: 'http://sk.wikipedia.org/wiki/S%C3%BAbor:Beck.jpg'
)

Celebrity.create(
  first_name: 'Beyonce',
  last_name: 'Knowles',
  photo_url: 'http://en.wikipedia.org/wiki/File:Beyonce_Knowles_with_necklaces.jpg'
)

Celebrity.create(
  first_name: 'Katy',
  last_name: 'Perry',
  photo_url: 'http://en.wikipedia.org/wiki/File:Katy_Perry_November_2014.jpg'
)

Celebrity.create(
  first_name: 'shaquille',
  last_name: "O'Neal",
  photo_url: 'http://en.wikipedia.org/wiki/File:Shaquille_O%27Neal_in_2011_(cropped).jpg'
)

Celebrity.create(
  first_name: 'Paul',
  last_name: 'Newman',
  photo_url: 'http://en.wikipedia.org/wiki/File:Paul_Newman_-_1963.jpg'
)
