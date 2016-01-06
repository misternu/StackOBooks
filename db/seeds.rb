50.times do
  User.new( username: Faker::Internet.user_name,
            hashed_password: "password")
end

20.times do
  Post.new( user_id: rand(1..50),
           title: Faker::Book.title + Faker::Lorem.words(4),
           body: Faker::Lorem.sentences(4) + Faker::Hipster.sentence )
end

# 20.times do
#   Response.new( user_id: rand(1..50),
#                 body: Faker::Lorem.sentences(2) + Faker::Hipster.sentence,
#                 comment_id: rand(1..20),
#                 comment_type: "Post" )
# end

# 30.times do
#     Response.new( user_id: rand(1..50),
#                 body: Faker::Lorem.sentences(2) + Faker::Hipster.sentence,
#                 comment_id: rand(1..20),
#                 comment_type: "Response" )
# end
