module Paginable
  extend ActiveSupport::Concern

  def paginate(collection)
    paginator.call(
      collection,
      params: pagination_params,
      base_url: request.url
    )
  end

  def paginator
    JSOM::Pagination::Paginator.new
  end

  def pagination_params
    params.permit![:page]
  end

  def render_collection(collection)
    options = {
      meta: collection.meta.to_h,
      links: collection.links.to_h
    }
    result = serializer.new(collection.items, options)
    render json: result, status: :ok
  end
end
