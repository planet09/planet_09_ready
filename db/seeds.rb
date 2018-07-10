# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.foreach(Rails.root.join('db', 'seed.csv'), {headers: true, encoding: "UTF-8"}) do |row|
  Post.create! row.to_hash
end

# require 'faker'
#
# 5.times do |i|
#   User.create(
#     name: Faker::LeagueOfLegends.champion,
#     email: "#{i+1}@#{i+1}",
#     password: 123123,
#     password_confirmation: 123123
#   )
# end
#
# 20.times do
#   Post.create(
#     title: Faker::Pokemon.name,
#     content: Faker::OnePiece.quote,
#     user_id: (1..5).to_a.sample
#   )
# end
#
# 10.times do
#   Comment.create(
#     content: "댓글",
#     user_id: (1..5).to_a.sample,
#     post_id: (1..10).to_a.sample
#   )
# end
