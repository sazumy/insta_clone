puts 'users ...'
5.times do
  user = User.create!(
    username: Faker::JapaneseMedia::StudioGhibli.unique.character,
    email: Faker::Internet.email,
    password: 'foobar',
    password_confirmation: 'foobar',
  )
end
