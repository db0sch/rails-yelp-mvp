# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Creating 100 fake restaurants
10.times do
  restaurant = Restaurant.new({
    name: Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.phone_number,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  })
  restaurant.save
  5.times do
    review = Review.new({
      content: Faker::Lorem.paragraph,
      rating: (0..5).to_a.sample,
      restaurant: restaurant
    })
  review.save
  end
end
