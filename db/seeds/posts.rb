puts 'posts ...'
User.all.each do |user|
  user.posts.create!(body: Faker::Hacker.say_something_smart)
end
