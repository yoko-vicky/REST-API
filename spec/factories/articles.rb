FactoryBot.define do
  factory :article do
    title { 'My new article' }
    content { 'This is my new article. Yeah!' }
    slug { 'my-new-article' }
  end
end
