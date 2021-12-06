class ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: serializer.new(articles), status: :ok
  end

  def show
    id = params[:id]
    render json: { id: id }
  end

  def serializer
    ArticleSerializer
  end
end
