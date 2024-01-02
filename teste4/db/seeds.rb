require 'faker'

10.times do
  Title.create(
    title: Faker::Lorem.words(number: 2).join(' '),
    genre: Faker::Book.genre,
    year: Faker::Number.between(from: 2000, to: 2022).to_s,
    country: Faker::Address.country,
    published_at: Faker::Date.between(from: 2.years.ago, to: Date.today),
    description: Faker::Lorem.sentence
  )
end
