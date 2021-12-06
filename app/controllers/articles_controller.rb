class ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles, status: :ok
  end

  def show
    id = params[:id]
    render json: { id: id }
  end
end
