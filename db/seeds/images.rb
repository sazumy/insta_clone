puts 'images ...'
User.limit(5).each do |user|
  post = user.posts.first
  post.images.create!(image: "https://picsum.photos/350/350/?random")
end
