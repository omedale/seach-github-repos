module Github
  class SearchRepositories
    attr_reader :params, :per_page
    BASE_URL = 'https://api.github.com/search/repositories'.freeze
    def initialize(params, per_page)
      @params = params
      @per_page = per_page
    end

    def call
      search
    end

    private

    def search
      uri = URI(BASE_URL)
      url_params = { q: params[:q], per_page: per_page }.merge(params[:page] ? { page: params[:page] } : {})
      uri.query = URI.encode_www_form(url_params)
      response = HTTParty.get(uri)
      if response.code == 200
        OpenStruct.new({ success?: true, payload: JSON.parse(response.body) })
      else
        OpenStruct.new({ success?: false, error: 'Something went wrong, please try again' })
      end
    end
  end
end
