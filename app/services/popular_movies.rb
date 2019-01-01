class PopularMovies < TheMoviesDatabaseService
  attr_reader :movies

  def initialize
    @errors = []
    @movies = []
  end

  def call
    @errors, @movies = TheMoviesDatabaseApi.popular_movies

    @movies = success? ? @movies.map { |m| setup_movie(m) }.slice(0, 4) : []

    self
  end
end
