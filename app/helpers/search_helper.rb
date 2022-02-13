module SearchHelper
  def current_page_params
    request.params.slice('q')
  end
end
