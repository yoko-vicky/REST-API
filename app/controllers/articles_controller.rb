class ArticlesController < ApplicationController
  def index
    articles = Article.latest_order
    paginated = paginator.call(
      articles,
      params: pagination_params,
      base_url: request.url
    )
    options = { meta: paginated.meta.to_h, links: paginated.links.to_h }
    render json: serializer.new(paginated.items, options), status: :ok
  end

  def show
    id = params[:id]
    render json: { id: id }
  end

  def serializer
    ArticleSerializer
  end

  def paginator
    JSOM::Pagination::Paginator.new
  end

  def pagination_params
    params.permit![:page]
  end
end
