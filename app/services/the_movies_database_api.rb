class TheMoviesDatabaseApi
  class << self
    def search_movies(query, page = 1)
      path   = 'search/movie'

      @response = TMDB_Conn.get(path, PARAMS.merge(query:  query, page: page))
      handle_response(true)
    end

    def similar_movies(movie_id)
      path   = "movie/#{movie_id}/similar"

      @response = TMDB_Conn.get(path, PARAMS)
      handle_response(true)
    end

    def top_movies
      path   = "movie/top_rated"

      @response = TMDB_Conn.get(path, PARAMS)
      handle_response(true)
    end

    def popular_movies
      path   = "movie/popular"

      @response = TMDB_Conn.get(path, PARAMS)
      handle_response(true)
    end

    def movie_details(movie_id)
      path   = "movie/#{movie_id}"

      @response = TMDB_Conn.get(path, PARAMS)
      handle_response
    end

    def image_url(image_path, size = 'original')
      "#{IMAGE_URL}/#{size}/#{image_path}?api_key=#{API_KEY}"
    end

    private

    def handle_response(multiple = false)
      body = JSON.parse(@response.body, symbolize_names: true)
      results = multiple ? body[:results] : body

      case @response.status
      when 200
        [[], results, body[:page]]
      when 401, 404
        [body.to_a, [], nil]
      else
        [["failure", "something went wrong"], [], nil]
      end
    end

    API_KEY   = Rails.application.credentials.tmdb[:api_key]
    BASE_URL  = 'https://api.themoviedb.org/3/'
    IMAGE_URL = 'https://image.tmdb.org/t/p' # :file_size/:file_path
    TMDB_Conn = Faraday.new(
      :url => BASE_URL,
      :request => {:params_encoder => Faraday::FlatParamsEncoder}
    )
    PARAMS = { api_key: API_KEY }
  end
end
