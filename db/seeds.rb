# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Dummyrank.create(rankname:"트와이스",content:"#트와이스 #쯔위 #정연 #What Is Love",url:"twice.jpg")
Dummyrank.create(rankname:"방탄소년단",content:"#bts #방탄 #뷔 #뷔 생일",url:"bts.jpg")
Dummyrank.create(rankname:"레드벨벳",content:"#redvelvet #레벨이들",url:"redvelvet.jpg")
Dummyrank.create(rankname:"mamamoo",content:"#마마무 #도른자들 #화사",url:"mamamoo.jpg")
Dummyrank.create(rankname:"워너원",content:"#wanna #Beautiful",url:"wanna.jpg")
Dummyrank.create(rankname:"Exo",content:"#Exo #엑소 #카이",url:"exo.jpg")
Dummyrank.create(rankname:"BlackPink",content:"#블핑이들 #블랙핑크",url:"blackpink.png")
Dummyrank.create(rankname:"태연",content:"#태연 #소녀시대 #I",url:"taeyeon.jpg")
Dummyrank.create(rankname:"위너",content:"#winner #위너",url:"winner.jpg")
Dummyrank.create(rankname:"Nell",content:"#넬 #기억",url:"nell.jpg")







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
