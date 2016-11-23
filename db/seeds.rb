# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.destroy_all

10.times do
  categories = ["chinese", "italian", "japanese", "french", "belgian"]
  restaurant = Restaurant.create(
    name: Faker::Hipster.word.capitalize,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: categories.sample
  )
  5.times do
    review = Review.create(
      content: Faker::Lorem.paragraph(1),
      rating: [0, 1, 2, 3, 4, 5].sample,
      restaurant: restaurant
    )
  end
end
