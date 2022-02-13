class GithubsController < ApplicationController
  ONE = 1
  def index
    query = params[:q].strip
    return unless query.present?

    @result = Github::SearchRepositories.new(params, PER_PAGE).call
    @prev_page, @next_page = pagination_meta
  end

  private

  def pagination_meta
    page = params[:page] ? params[:page].to_i : ONE
    total_pages = (@result.payload['total_count'].to_f / PER_PAGE).ceil
    next_page = page < total_pages ? page + ONE : nil
    prev_page = page <= total_pages && page > ONE ? page - ONE : nil
    [prev_page, next_page]
  end
end
