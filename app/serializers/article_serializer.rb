class ArticleSerializer
  include JSONAPI::Serializer
  attributes :title, :content, :slug
end
