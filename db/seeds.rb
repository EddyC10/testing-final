# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


100.times do
  sizes_array = []
  (1..18).each do |count|
    sizes_array.push(count.to_s)
  end

  owner_id = []
  (1..100).each do |count|
    owner_id.push(count.to_s)
  end

  shoe_type = ['Mens', 'Womens', 'Big Kids', 'Little Kids', 'Toddlers']
  titles = Faker::Name.name
  descriptions = Faker::Quote.famous_last_words
  boolean = [true, false]
  images = Rails.root.join("app/assets/images/shoe_pic.jpg").open
  shoes = Shoe.new(
    owner_id: owner_id.sample(),
    image: images,
    title: titles,
    description: descriptions,
    shoe_type: shoe_type.sample(),
    size: sizes_array.sample(),
    deadstock: boolean.sample(),
    authentic: boolean.sample()
  )
  shoes.save
end

100.times do
  email_names = Faker::Name.first_name
  usernames = Faker::Name.first_name
  users = User.new(
    email: email_names + "@example.com",
    username: usernames,
    password_digest: "hey"
  )
  users.save
end
