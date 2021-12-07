FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(number: 6).capitalize }
    content { Faker::Lorem.paragraph(sentence_count: 2) }
    slug { Faker::Lorem.characters(number: 8) }
  end
end
