puts 'images ...'
Post.all.each do |post|
  post.images.create!(image: "https://picsum.photos/350/350/?random")
end
