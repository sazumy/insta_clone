puts 'images ...'
Post.all.each do |post|
  post.images.create!(photo: open("#{Rails.root}/db/fixtures/sample_0#{rand(1..3)}.jpg"))
end
