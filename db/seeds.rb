# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    url: Faker::Avatar.image,
    password: 'password'
    )
end

20.times do
  Pairing.create!(
    mentor_id: rand(1..10),
    start_time: Faker::Time.forward(14, :night)
    )
end
