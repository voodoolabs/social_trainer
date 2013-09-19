# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

j = User.create!(name: "John", password: "j", password_confirmation: "j", email: "j@j.com", friend_id: 1)
n = User.create!(name: "Nick", password: "n", password_confirmation: "n", email: "n@n.com", friend_id: 2)
c = User.create!(name: "Cory", password: "c", password_confirmation: "c", email: "c@c.com", friend_id: 3)
w = User.create!(name: "Wendy", password: "w", password_confirmation: "w", email: "w@w.com", friend_id: 4)

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


