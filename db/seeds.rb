# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 0,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})
##Users
## all test user accounts has password: "test"
User.create first_name: "Testy", last_name:"McTesterface", email:"test@test.com", password_digest:"$2a$10$Y5Q5RdAwYSR2uohkVg40OOuciQ1dfEY5nylF3Lpf14N7yIAyRwwgC"
User.create first_name: "Alice", last_name:"Testerson", email:"alice@test.com", password_digest:"$2a$10$Y5Q5RdAwYSR2uohkVg40OOuciQ1dfEY5nylF3Lpf14N7yIAyRwwgC"
User.create first_name: "Bob", last_name:"Testington", email:"bob@test.com", password_digest:"$2a$10$Y5Q5RdAwYSR2uohkVg40OOuciQ1dfEY5nylF3Lpf14N7yIAyRwwgC"
User.create first_name: "Charles", last_name:"Testerford", email:"charles@test.com", password_digest:"$2a$10$Y5Q5RdAwYSR2uohkVg40OOuciQ1dfEY5nylF3Lpf14N7yIAyRwwgC"
User.create first_name: "Don", last_name:"Testershire", email:"don@test.com", password_digest:"$2a$10$Y5Q5RdAwYSR2uohkVg40OOuciQ1dfEY5nylF3Lpf14N7yIAyRwwgC"

##Reviews

Review.create product_id: 12, user_id: 1, description: "This is the most reddest red bookshelf I've ever seen", rating: 5
Review.create product_id: 12, user_id: 2, description: "It's too bookshelfy for me", rating: 1
Review.create product_id: 12, user_id: 3, description: "It has enough redness but not enough reddish-ness", rating: 3
Review.create product_id: 12, user_id: 4, description: "Smells funky if you try to burn it", rating: 4
Review.create product_id: 11, user_id: 2, description: "It's so electric!", rating: 5
Review.create product_id: 10, user_id: 3, description: "Fits 9 people comfortably!", rating: 5
Review.create product_id: 10, user_id: 3, description: "I bought two!", rating: 2
Review.create product_id: 10, user_id: 3, description: "Smells good when you burn it", rating: 5
Review.create product_id: 9, user_id: 4, description: "Display doesn't work!", rating: 1
Review.create product_id: 8, user_id: 5, description: "Can slice other things as well!", rating: 5
Review.create product_id: 7, user_id: 3, description: "Slipping hazard!", rating: 1
Review.create product_id: 6, user_id: 3, description: "My company issued this as our uniform, it's so comfy!", rating: 5
Review.create product_id: 5, user_id: 3, description: "Don't be fooled by the description! They only spy on Russians!", rating: 5
Review.create product_id: 4, user_id: 3, description: "All my other socks are more socksy than this", rating: 2
Review.create product_id: 3, user_id: 3, description: "I was so suprised to receive the glasses and beard too!", rating: 5
Review.create product_id: 3, user_id: 3, description: "I have one that looks just like this from Arc'teryx that costs $9230.00! ", rating: 5



puts "DONE!"
