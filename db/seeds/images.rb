puts 'images ...'
Post.all.each do |post|
  post.images.create!(photo: open("#{Rails.root}/db/fixtures/sample_01.jpeg"))
end
