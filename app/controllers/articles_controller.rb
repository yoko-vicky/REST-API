class ArticlesController < ApplicationController
  include Paginable

  def index
    paginated = paginate(Article.latest_order)
    render_collection(paginated)
  end

  def show
    id = params[:id]
    render json: { id: id }
  end

  def serializer
    ArticleSerializer
  end
end
