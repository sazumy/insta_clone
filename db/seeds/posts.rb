puts 'posts ...'
User.limit(10).each do |user|
  user.posts.create!(body: Faker::Hacker.say_something_smart,
    images: "https://picsum.photos/350/350/?random")
end
