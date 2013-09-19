# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

j = User.create!(name: "John", about: "This is a description of John", password: "j", password_confirmation: "j", photo_url: "jon.jpeg", email: "j@j.com", friend_id: 1)
n = User.create!(name: "Nick", about: "This is a description of Nick", password: "n", password_confirmation: "n", photo_url: "nicksmitpic.jpg", email: "n@n.com", friend_id: 2)
c = User.create!(name: "Cory", about: "This is a description of Cory", password: "c", password_confirmation: "c", photo_url: "cory.jpeg", email: "c@c.com", friend_id: 3)
w = User.create!(name: "Wendy", about: "This is a description of Wendy", password: "w", password_confirmation: "w", photo_url: "wendi.png", email: "w@w.com", friend_id: 4)

10.times do
	Post.create!(title: Faker::Lorem.sentence(3), text_field: Faker::Lorem.paragraph(3), user_id: rand(1..4))
end

30.times do
	Comment.create!(post_id: rand(1..10), user_id: rand(1..4), content: Faker::Lorem.paragraph(4))
end

Friendship.create!(user_id: 1, friend_id: 2)
Friendship.create!(user_id: 1, friend_id: 3)
Friendship.create!(user_id: 1, friend_id: 4)

Friendship.create!(user_id: 2, friend_id: 3)
Friendship.create!(user_id: 2, friend_id: 4)

Friendship.create!(user_id: 3, friend_id: 4)


