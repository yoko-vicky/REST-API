class ArticleSerializer
  include JSONAPI::Serializer
  # set_type :some_prefer_name
  attributes :title, :content, :slug
end
